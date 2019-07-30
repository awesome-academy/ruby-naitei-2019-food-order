class CreateDailyFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_foods do |t|
      t.integer :daily_id
      t.integer :food_id
      t.integer :price
      t.text :review
      t.integer :star
      t.integer :user_id
      t.timestamps
    end
  end
end
