class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.integer :user_id, null: false
      t.string :lost_or_found, null: false
      t.string :res_type, null: false
      t.datetime :date
      t.string :description
      t.datetime :closed_at

      t.timestamps
    end
  end
end
