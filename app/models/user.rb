class User < ApplicationRecord
  # Bcryptのメソッド
  has_secure_password


  ########## 普通の処理 #############

  # passwordのバリデーションやコールバックは、ユーザ作成時以外は必要のないものです。
  # emailのバリデーションもユーザ作成時とメールアドレス変更時だけ必要なものなので、
  # 常に必要というわけではありません。
  #
  # こんな時にform objectを利用して
  # Userモデルに書かれたロジックを外出しすることができます。




  #### フォームオブジェクトを使うと、全部いらない

  # validates :email, presence: true
  #
  # # コミット(レコード)を作成した後
  # after_create_commit :send_welcome_mail
  #
  # # ようこそメールを送る
  # def send_welcome_mail
  #   UserMailer.welcome(self).deliver_later
  # end


  #### モジュール練習 ########################
  include Talkable

  attr_accessor :name, :latitude, :longitude


end
