class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :authenticate_admin!, only: :index

  def index
    @users = User.order_by_name.page(params[:page])
                 .per(Settings.users_pagination)
  end

  def show; end

  def new
    @user = User.new
  end

  def create; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update user_params
        format.html{redirect_to @user, notice: t("user_updated")}
        format.json{render :show, status: :ok, location: @user}
      else
        format.html{render :edit}
        format.json{render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "not_user"
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :first_name, :last_name
  end
end
