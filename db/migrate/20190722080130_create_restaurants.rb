class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :average_star, :default => 0
      t.integer :selected_count, :default => 0
      t.string :address

      t.timestamps
    end
  end
end
