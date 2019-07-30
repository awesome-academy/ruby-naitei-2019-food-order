Admin.create! username: "admin",
              password: "admin"

50.times do |n|
  user = User.new
  user.first_name = Faker::Games::LeagueOfLegends.champion
  user.last_name = Faker::Games::LeagueOfLegends.champion
  user.email = "example-#{n+1}@gmail.com"
  user.password = "123456"
  user.save!
end

10.times do |n|
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.full_address
  restaurant.save!
end

restaurants = Restaurant.take(9)
9.times do |n|
  name = Faker::Food.dish
  description = Faker::Food.description
  default_price = Faker::Number.number(2)
  status = "1"
  restaurants.each do |restaurant|
    food = Food.new
    food.restaurant_id = restaurant.id
    food.name = name
    food.default_price = default_price
    food.status = status
    food.description = description
    food.save
  end
end

restaurant = restaurants.to_a.sample
daily = Daily.new
daily.restaurant_id = restaurant.id
daily.date = DateTime.now.to_date
daily.discount = 10.0
daily.start_time_order = Faker::Time.between(0.days.ago, DateTime.now, :morning)
daily.end_time_order = Faker::Time.between(daily.start_time_order, daily.start_time_order + 1, :morning)
daily.save

foods = Food.all
foods.each do |food|
  image = FoodImage.new
  image.food_id = food.id
  image.image_link = "/assets/images/burger.jpg"
  image.save
end
foods.each do |food|
  image = FoodImage.new
  image.food_id = food.id
  image.image_link = "/assets/images/ramen.jpg"
  image.save
end
foods.each do |food|
  image = FoodImage.new
  image.food_id = food.id
  image.image_link = "/assets/images/food.jpg"
  image.save
end

restaurants = Restaurant.all
restaurant = Restaurant.first
