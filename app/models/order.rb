class Order < ApplicationRecord

  # 消費税を担当するオブジェクトを別に作って連携させる
  # 税には単価が含まれます
  def tax_include_amount
    TaxController.with_tax(amount, on: created_at)
  end
end
