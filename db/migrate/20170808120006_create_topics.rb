class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :user_id, null: false
      t.integer :node_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :last_reply_user_id
      t.string :last_reply_user_nickname
      t.string :last_reply_user_username
      t.datetime :last_reply_at
      t.integer :praises_count, default: 0
      t.integer :replies_count, default: 0, null: false
      t.integer :status
      t.boolean :is_excellent, default: false
      t.datetime :deleted_at
      t.string :deleted_by
      t.datetime :closed_at

      t.timestamps

      t.index :deleted_at
      t.index :praises_count
    end
  end
end
