class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.string :name, null: false
      t.integer :topics_count, default: 0

      t.timestamps
    end
  end
end
