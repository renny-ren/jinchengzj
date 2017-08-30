class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :reply_id, null: false
      t.string :target_nickname

      t.timestamps
    end
  end
end
