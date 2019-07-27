class CreateFoodImages < ActiveRecord::Migration[5.2]
  def change
    create_table :food_images do |t|
      t.string :image_link
      t.integer :food_id
      t.timestamps
    end
  end
end
