class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.string :lost_or_found, null: false
      t.string :res_type, null: false
      t.datetime :date
      t.string :title
      t.string :description
      t.datetime :closed_at
      t.datetime :last_reply_at
      t.integer :replies_count, default: 0
      t.string :last_reply_username
      t.string :last_reply_nickname

      t.timestamps
    end
  end
end
