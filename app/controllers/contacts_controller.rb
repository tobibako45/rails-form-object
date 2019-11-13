class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)
    if @contact.save
      redirect_to :contacts, notice: 'お問い合わせを受け付けました'
    else
      render :new
    end
  end

  private

  def contact_params
    tete = params

    params.require(:contact_form).permit(:first_name, :last_name, :email, :body)
  end
end
