class Signup
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation

  validates :email,
            presence: true,
            format: { with: /\A.+@.+\z/ }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: { allow_blank: true }

  def save
    return false if invalid?

    user = User.new(email: email, password: password, password_confirmation: password_confirmation)
    user.save!
    UserMailer.welcome(user).deliver_later
    true
  end
end
