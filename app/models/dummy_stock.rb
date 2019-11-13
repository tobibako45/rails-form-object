class DummyStock

  include ActiveModel::Model
  include ActiveModel::Attributes

  # ActiveRecordのやつと同じ
  # ActiveModel::Attributesをincludeしたら使える
  # クラス属性の型を意識しなくても、指定の型へ変換してくれています。
  attr_accessor :product_code, :quantity

  attribute :verified, :boolean

  validates :product_code, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}

  def save
    # バリデーションの動作だけ確認して、実際のAPIとの通信はしない
    validate # valid?のエイリアス
  end
end
