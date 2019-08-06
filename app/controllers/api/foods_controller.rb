module Api
  class FoodsController < ApplicationController
    before_action :authorize_access_request!
    include SessionsHelper
    include ActionController::Cookies

    def index
      daily = Daily.today
      if daily.nil?
        render json: {
          restaurant: nil
        }
      else
        restaurant = Restaurant.find_by id: daily.restaurant_id
        if restaurant.nil?
          render json: {
            restaurant: nil
          }
        end
        foods = restaurant.foods
        food_images = []
        foods.each do |f|
          food_images << f.food_images
        end
        render json: {
          foods: foods,
          res_name: restaurant.name,
          res_id: restaurant.id,
          food_images: food_images
        }
      end
    end

    def save
      daily = Daily.today
      if !daily.nil?
        daily_id = daily.id
        current_user_id = current_user.id
        orders = params["orders"]
        daily_orders = []
        if orders
          orders.each do |order|
            daily_food = DailyFood.new
            daily_food.daily_id = daily_id
            daily_food.food_id = order["id"]
            daily_food.price = order["default_price"]
            daily_food.count = order["number"]
            daily_food.user_id = current_user_id
            daily_orders << daily_food if daily_food.save!
          end
        end
        render json: {
          daily_orders: daily_orders
        }
      else
        render json: {
          daily_food: nil
        }
      end
    end
  end
end
