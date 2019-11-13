class ContactForm

  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :body

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :body, presence: true

  def save
    return false if invalid?
    # 保存・通知・ロギングなどの処理    #
    # contact_form = ContactForm.new(first_name: first_name, last_name: last_name, email: email, body: body)
    # contact_form.save!
    #
    # よくわからん！！！！
    true
  end

end
