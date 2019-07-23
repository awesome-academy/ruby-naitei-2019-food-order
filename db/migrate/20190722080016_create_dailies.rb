class CreateDailies < ActiveRecord::Migration[5.2]
  def change
    create_table :dailies do |t|
      t.datetime :date
      t.integer :restaurant_id
      t.float :discount, :default => 0
      t.datetime :start_time_order
      t.datetime :end_time_order

      t.timestamps
    end
  end
end
