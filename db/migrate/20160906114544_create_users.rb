class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.string :nickname
      t.integer :qq
      t.string :avatar_url
      t.string :signature
      t.integer :topics
      t.integer :replies
      t.integer :level
      t.integer :follower
      t.integer :following

      t.timestamps
    end
  end
end
