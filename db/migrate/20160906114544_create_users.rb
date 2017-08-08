class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :nickname
      t.string :gender
      t.string :qq
      t.string :wechat
      t.string :city
      t.string :signature
      t.integer :topics
      t.integer :replies
      t.integer :level
      t.integer :follower, default: 0, null: false
      t.integer :following, default: 0, null: false
      t.string :school
      t.string :department
      t.string :major

      t.timestamps
    end
  end
end
