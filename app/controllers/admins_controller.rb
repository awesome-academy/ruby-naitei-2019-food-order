class AdminsController < ApplicationController
  before_action :logged_in_admin, only: :dashboard
  def dashboard; end
end
