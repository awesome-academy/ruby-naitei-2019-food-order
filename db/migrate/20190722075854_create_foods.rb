class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :type
      t.integer :default_price
      t.integer :restaurant_id
      t.boolean :status
      t.float :average_star
      t.string :description
      t.timestamps
    end
  end
end
