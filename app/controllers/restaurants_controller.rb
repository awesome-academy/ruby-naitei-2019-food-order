class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i(show edit update destroy)
  before_action :authenticate_admin!

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params

    if @restaurant.save
      flash[:success] = t("restaurant.start_case") + t("flash.create_success")
      redirect_to @restaurant
    else
      flash[:danger] = t("restaurant.start_case") + t("flash.create_failed")
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = t("restaurant.start_case") + t("flash.update_success")
      redirect_to @restaurant
    else
      flash[:danger] = t("restaurant.start_case") + t("flash.update_failed")
      render :edit
    end
  end

  def destroy
    if @restaurant.destroy
      flash[:success] = t("restaurant.start_case") + t("flash.delete_success")
    else
      flash[:danger] = t("restaurant.start_case") + t("flash.delete_failed")
    end

    redirect_to restaurants_url
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find_by id: params[:id]
    redirect_to restaurants_url unless @restaurant
  end

  def restaurant_params
    params.require(:restaurant).permit :name, :type, :address
  end
end
