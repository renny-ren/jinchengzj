class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :nickname
      t.string :gender
      t.string :qq
      t.string :wechat
      t.string :city
      t.string :signature
      t.string :school
      t.string :department
      t.string :major
      t.string :role, default: 'member'
      t.integer :level, default: 1
      t.integer :topics_count, default: 0, null: false
      t.integer :replies_count, default: 0, null: false
      t.integer :comments_count, default: 0
      t.integer :followers_count, default: 0, null: false
      t.integer :following_count, default: 0, null: false

      t.timestamps
    end
  end
end
