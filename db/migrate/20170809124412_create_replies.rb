class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.text :body, null: false
      t.datetime :deleted_at
      t.integer :praise_count, default: 0

      t.timestamps
    end
  end
end
