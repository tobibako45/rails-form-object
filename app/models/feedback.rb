class Feedback < ApplicationRecord
  ###########################################
  # フォームオブジェクト（フォームクラス）を利用した例
  ###########################################

  # フォームオブジェクトとして、ActiveModel::Modelをincludeしたクラスを用意
  # Active Modelは、Active RecordからDBに依存する部分を除いた振る舞いを提供しているライブラリです。
  # これを利用することにより、DBを利用しないフォームでもActive Recordを利用したときと同じような記述をすることができます。
  include ActiveModel::Model

  attr_accessor :title, :body

  validates :title, :body, presence: true

  def save
    return false if invalid? # 引っかかればtrue

    # ここでメールを送るてい
    # AdminMailer.feedback(title, body).deliver_later
    true
  end

end
