module Api
  class SessionsController < ApplicationController
    private

    def google_auth
      # Get access tokens from the google server
      access_token = request.env["omniauth.auth"]
      user = User.create_from_omniauth(access_token)

      session[:user_id] = user.id
      user.access_token = access_token.credentials.token
      # Refresh_token to request new access_token
      # Note: Refresh_token is only sent once during the first request
      refresh_token = access_token.credentials.refresh_token
      user.refresh_token = refresh_token if refresh_token.present?
      user.save
      session[:user_id] = user.id
      @token = access_token.credentials.token
      render "popup/login-google-popup.html.erb"
    end

    def login
      google_auth
    end

    def destroy
      session[:user_id] = nil

      redirect_to root_path
    end

    private

    def is_authenticated
      if :authenticate_user!
        render json: {
          is_logged_in: TRUE
        }
      else render json: {
        is_logged_in: FALSE
      }
      end
    end
  end
end
