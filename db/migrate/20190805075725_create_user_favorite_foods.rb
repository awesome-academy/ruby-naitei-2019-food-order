class CreateUserFavoriteFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorite_foods do |t|
      t.integer :food_id
      t.integer :user_id
      t.timestamps
    end
  end
end
