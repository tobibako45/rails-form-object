class CreateContactForm < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_forms do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :body, null: false, default: ''
      t.timestamps
    end
  end
end
