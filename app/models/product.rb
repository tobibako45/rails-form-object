
# 消費税を担当するオブジェクトを別に作って連携させる
class Product < ApplicationRecord
  # 税には単価が含まれます
  def tax_include_unit_price(date)
    TaxController.with_tax(unit_price, on: date)
  end
end
