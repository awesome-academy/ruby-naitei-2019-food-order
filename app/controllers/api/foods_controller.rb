module Api
  class FoodsController < ApplicationController
    before_action :authorize_access_request!
    include SessionsHelper
    include ActionController::Cookies

    def index
      daily = Daily.find_by date: DateTime.now.to_date
      if daily.nil?
        render json: {
          restaurant: nil
        }
      else
        res = Restaurant.find_by id: daily.restaurant_id
        foods = Food.where restaurant_id: res.id
        food_images = []
        foods.each do |f|
          food_images << f.food_images
        end
        res_name = res.name
        res_id = res.id
        render json: {
          foods: foods,
          res_name: res.name,
          res_id: res.id,
          food_images: food_images
        }
      end
    end

    def add_food; end
  end
end
