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
        favourite_list = current_user.user_favorite_foods
        render json: {
          foods: foods,
          res_name: restaurant.name,
          res_id: restaurant.id,
          food_images: food_images,
          discount: daily.discount,
          favourite_list: favourite_list
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

    def add_favorite
      food_id = params["food_id"]
      if !food_id.nil?
        tmp = UserFavoriteFood.find_by user_id: current_user.id, food_id: food_id
        if tmp.nil?
          user_favorite = UserFavoriteFood.new
          user_favorite.user_id = current_user.id
          user_favorite.food_id = food_id
          if user_favorite.save!
            render json: {
              user_favorite: user_favorite
            }
          else
            render json: {
              user_favorite: {}
            }
          end
        else
          render json: {
            user_favorite: tmp
          }
        end
      else
        render json: {
          user_favorite: nil
        }
      end
    end

    def remove_favorite
      food_id = params["food_id"]
      if !food_id.nil?
        tmp = UserFavoriteFood.find_by user_id: current_user.id, food_id: food_id
        if tmp.nil?
          render json: {
            user_favorite: {}
          }
        else
          tmp.destroy
          render json: {
            user_favorite: tmp
          }
        end
      else
        render json: {
          user_favorite: nil
        }
      end
    end
  end
end
