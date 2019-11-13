require 'net/http'

class StocksController < ApplicationController

  ##### 変更前 ################

  # def create
  #   # ① 管理者がフォームに入力した在庫情報をstock_params(params[:stock])で受け取り、
  #   # それを検証して、問題があれば差し戻す。
  #   errors = validate_stock_params
  #   # errorsに何か入っていれば、flashメッセージを表示して、contacts/newにrender
  #   # そしてreturn
  #   if errors.present?
  #     flash[:alert] = errors.join
  #     render :'contacts/new'
  #     return
  #   end
  #
  #   # ② 問題がなければ、リクエストボディにJSONを組み立てる
  #   body = {
  #       product_code: stock_params[:product_code],
  #       quantity: stock_params[:quantity],
  #       verified: stock_params[:verified] == "1"
  #   }.to_json
  #
  #   # ③ そのJSONを使って在庫管理APIにリクエストを送信し、
  #   # エラーがあればエラーメッセージを表示する
  #   begin
  #     response = Net::HTTP.post(
  #         URI('http://localhost:1234/stocks'),
  #         body,
  #         "Content-Type" => "application/json"
  #     )
  #   rescue => e
  #     redirect_to new_stock_url, flash: {alert: "在庫管理システムに接続できませんでした"}
  #     logger.error e.full_message
  #   end
  #
  #   # ④ 最後に、レスポンスの成否を調べ、然るべき対応を行う
  #   if response.code == '200'
  #     redirect_to new_stock_url, flash: {success: "在庫作成が完了しました！"}
  #   else
  #     flash.now[:alert] = error_message_from_response(response)
  #     render :new
  #   end
  # end
  #
  # private
  #
  # def stock_params
  #   params.require(:stock).permit(:product_code, :quantity, :verified)
  # end
  #
  # def validate_stock_params
  #   # .tap  { }ブロック内で処理を実行し、処理結果に関わらずレシーバ自身を返すメソッド。
  #   [].tap do |errors|
  #     # params[:product_code]の有無を調べて、無ければerrorsにメッセージを代入
  #     errors << "商品コードを指定してください。" if stock_params[:product_code].blank?
  #     errors << "数量を指定してください。" if stock_params[:quantity].blank?
  #     errors << "数量は１以上の数で指定してください。" if stock_params[:quantity].to_i <= 0
  #   end
  # end
  #
  # def error_message_form_response(response)
  #   error_code = JSON.parse(response.body)['error_code']
  #
  #   case error_code
  #   # 製品が見つかりません
  #   when 'product_not_found'
  #     "指定の商品は存在しません。"
  #   # 利用できない製品
  #   when 'product_unavailable'
  #     "取引終了商品です。"
  #   else
  #     "エラーが発生しました。code = #{error_code}"
  #   end
  # end


  #### 変更後 #########################

  # def create
  #   stock = Stock.new(stock_params)
  #
  #   if stock.save
  #     redirect_to new_stock_url, flash: {success: "在庫作成が完了しました！"}
  #   else
  #     flash.now[:alert] = stock.errors.full_message.join
  #     render :new
  #   end
  # end

  ### ダミーで実装 ###########
  def create
    stock = DummyStock.new(stock_params)

    if stock.save
      redirect_to new_stock_url, flash: {success: "在庫作成が完了しました。"}
    else
      flash.now[:alert] = stock.errors.full_message.join
      render :new
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:product_code, :quantity, :verified)
  end


end
