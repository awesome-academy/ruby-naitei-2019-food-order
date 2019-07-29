class AdminSessionsController < ApplicationController
  def new; end

  def create
    admin = Admin.find_by(username: params[:session][:username].downcase)

    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to admins_path
    else
      flash.now[:danger] = t "flash.login_fail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_login_path
  end
end
