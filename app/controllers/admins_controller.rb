class AdminsController < ApplicationController
  before_action :load_admin, only: %i(show edit)

  def index
    @admins = Admin.all
  end

  def show; end

  def edit; end

  def create
    @admin = Admin.new admin_params

    respond_to do |format|
      if @admin.save
        redirect_to @admin, notice: t("successfully")
      else
        render :new
      end
    end
  end

  private

  def load_admin
    @admin = Admin.find_by id: params[:id]
    return if @admin
    flash[:warning] = t "not_admin"
    redirect_to root_path
  end

  def admin_params
    params.require(:admin).permit :username, :password
  end
end
