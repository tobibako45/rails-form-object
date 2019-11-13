class CouponExchange

  attr_accessor :error

  def initialize(coupon, user)
    @coupon = coupon
    @user = user
  end

  # execute 実行する
  def execute
    # クーポンが無い時
    unless @coupon
      @error = '該当のクーポンの発行は終了しました。'
      return false
    end

    # このユーザーの、引き出し可能なポイントが無い時
    unless @user.withdrawable_point?(@coupon.required_point)
      @error = 'クーポンの取得に必要なポイントが足りません。'
      return false
    end

    begin
      ActiveRecord::Base.transaction do
        @user.withdraw_point(@user.required_point)
        @coupon.give_to(@user)
      end
    rescue => e
      @error = 'クーポンの取得に失敗しました。'
      Rails.logger.error e.full_message
      return false
    end

    true

  end

end
