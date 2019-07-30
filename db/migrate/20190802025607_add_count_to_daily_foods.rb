class AddCountToDailyFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_foods, :count, :integer
  end
end
