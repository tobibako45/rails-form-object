require 'net/http'

class Stock

  # ActiveModelをinclude
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  # getter,setter
  attr_accessor :product_code, :quantity
  # 属性を設定
  attribute :verified, :boolean

  validates :product_code, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1} # greater_than_or_equal_t 数字が1以上であるか

  def save
    # validate valid?メソッドのエイリアス

    # valid?
    # バリデーションが通るか手動で確認。
    # メソッドを実行するとバリデーションが実行されます。
    # バリデーションが通ればtrueを返し、引っかかればfalseを返します。
    # ちなみにinvalid?メソッドは逆の振る舞いをします。
    #
    # person.errors.messagesみたいな感じでエラーメッセージを確認。
    validate && post
  end

  private

  # ActiveModel::Serializers::JSON用にシリアライズ方法を指定
  def attributes
    {product_code: product_code, quantity: quantity, verified: verified}
  end

  def post
    begin
      response = Net::HTTP.post(
          URI('http://localhost:1234/stocks'),
          to_json, # 「attributes」メソッドの指定に従ってシリアライズ
          'Content-Type' => 'application/json'
      )
    rescue => e
      errors.add(:base, '在庫管理システムに接続できませんでした。')
      Rails.logger.error e.full_message
    end

    return true if response.code == '200'
    assign_response_errors(response)
    false
  end

  # 応答エラーを割り当てます(response)
  def assign_response_errors(response)

    error_code = JSON.parse(response.body)['error_code']

    error_massage =
        case error_code
        when 'product_not_found'
          '指定の商品は存在しません。'
        when 'product_unavailable'
          '取引終了商品です。'
        else
          "エラーが発生しました。code = #{error_code}"
        end

    errors.add(:base, error_massage)
  end
end
