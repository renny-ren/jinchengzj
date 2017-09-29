class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.integer :reply_to_id
      t.string :target_id
      t.string :target_type
      t.integer :mentioned_users_id, default: [], array: true
      t.text :body, null: false
      t.datetime :deleted_at
      t.integer :praises_count, default: 0
      t.integer :comments_count, default: 0
      t.string :action

      t.timestamps
    end
  end
end
