module Api
  class UsersController < ApplicationController
    before_action :authorize_access_request!
    include SessionsHelper
    include ActionController::Cookies

    def edit; end

    def show; end

    def update first_name, last_name
      if current_user.update({first_name: first_name, last_name: last_name})
        render json: {
          user: current_user
        }
      end
    end
  end
end
