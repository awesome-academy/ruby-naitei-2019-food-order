class DailiesController < ApplicationController
  before_action :find_daily, only: %i(show edit update)

  def index
    @dailies = Daily.all
  end

  def new
    @daily = Daily.new
  end

  def create
    @daily = Daily.new daily_params

    if @daily.save
      flash[:success] = t("daily.start_case") + t("flash.create_success")
      redirect_to @daily
    else
      flash[:danger] = t("daily.start_case") + t("flash.create_failed")
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @daily.update_attributes(daily_params)
      flash[:success] = t("daily.start_case") + t("flash.update_success")
      redirect_to @daily
    else
      flash[:danger] = t("daily.start_case") + t("flash.update_failed")
      render :edit
    end
  end

  private

  def find_daily
    @daily = Daily.find_by id: params[:id]
    redirect_to dailies_url unless @daily
  end

  def daily_params
    params.require(:daily).permit :date, :restaurant_id,
      :discount, :start_time_order, :end_time_order
  end
end
