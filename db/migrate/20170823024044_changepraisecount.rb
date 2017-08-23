class Changepraisecount < ActiveRecord::Migration[5.0]
  def change
    change_table :topics do |t|
      t.rename :praise_count, :praises_count
    end
  end
end
