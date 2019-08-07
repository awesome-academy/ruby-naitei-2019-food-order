class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: :dashboard
  def dashboard; end
end
