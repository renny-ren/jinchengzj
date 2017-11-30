class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :body, null: false
      t.string :contact_info

      t.timestamps
    end
  end
end
