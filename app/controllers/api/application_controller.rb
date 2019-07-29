module Api
  class ApplicationController < ActionController::API
    include JWTSessions::RailsAuthorization
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def current_user
      @current_user ||= User.find(payload["user_id"])
    end

    def not_authorized
      render json: {error: t("not_authorized")}, status: :unauthorized
    end

    def record_not_found
      redirect_to root_path
    end
  end
end
