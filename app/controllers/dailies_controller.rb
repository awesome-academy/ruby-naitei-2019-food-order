class DailiesController < ApplicationController
  before_action :set_daily, only: [:show, :edit, :update]

  def show; end

  def new
    @daily = Daily.new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  def edit; end

  def create
    @daily = Daily.new(daily_params)

    if @daily.save
      redirect_to @daily, notice: t("successfully")
    else
      render :new
    end
  end

  def update
    if @daily.update(daily_params)
      redirect_to @daily, notice: t("updated")
    else
      render :edit
    end
  end

  private

  def set_daily
    @daily = Daily.find(params[:id])
  end

  def daily_params
    params.require(:daily).permit(:date, :discount, :start_time_order, :end_time_order, :restaurant_id)
  end
end
