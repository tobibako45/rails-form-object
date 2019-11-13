class CouponExchangesController < ApplicationController

  ### 変更前 ###############

  # def create
  #   coupon = Coupon.available.where(code: params[:code]).first
  #
  #   # couponが無かったら
  #   unless coupon
  #     redirect_to({action: :new}, alert: '該当クーポンの発行は終了しました。')
  #     return
  #   end
  #
  #   # 現在のユーザーに、引き出し可能なポイントが無かったら
  #   # withdrawable_point 引き出し可能なポイント required_point 必要なポイント
  #   unless current_user.withdrawable_point?(coupon.required_point)
  #     redirect_to({action: :new}, alert: 'クーポンの取得に必要なポイントが足りません。')
  #     return
  #   end
  #
  #   begin
  #     ActiveRecord::Base.transaction do
  #       # withdraw_point 撤退ポイント
  #       current_user.withdraw_point(coupon.required_point)
  #       # coupon give_to current_user クーポンを、現在のユーザーに与えます。
  #       coupon.give_to(current_user)
  #     end
  #   rescue => e
  #     redirect_to({action: :new}, alert: 'クーポンの取得に失敗しました。')
  #     logger.error e.full_message
  #     return
  #   end
  #
  #   redirect_to({action: :new}, notice: 'クーポンを取得しました。')
  # end


  #### 変更後 ###############################
  def create
    coupon = Copon.available.where(code: params[:code]).first
    exchange = CouponExchange.new(coupon, current_user)

    if exchange.execute
      redirect_to({action: :new}, notiec: 'クーポンを取得しました。')
    else
      redirect_to({action: :new}, alert: exchange.error)
    end
  end

  # def resume_form_params
  #   params.require(:student).permit(
  #       :introduction, :admission, :graduate,
  #       job_histories_attributes: [:start_date, :end_date, :company_name, :position, :content,:id, :_destroy],
  #       education_histories_attributes: [:start_date, :end_date, :school_name, :major_name, :id, :_destroy],
  #       portfolios_attributes: [:service_name, :service_url, :service_content,:id, :_destroy])
  # end

end
