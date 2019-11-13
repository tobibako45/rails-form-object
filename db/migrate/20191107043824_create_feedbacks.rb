class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :title, null: false, default: ''
      t.string :body, null: false, default: ''
      t.timestamps
    end
  end
end
