module Api
  class UsersController < ApplicationController
    before_action :authorize_access_request!
    include SessionsHelper
    include ActionController::Cookies

    def edit; end

    def show; end

    def update
      first_name = params[:first_name]
      last_name = params[:last_name]
      if current_user.update(first_name: first_name, last_name: last_name)
        render json: {
          user: current_user
        }
      end
    end

    def avatar
      require "fileutils"
      tmp = params[:avatar].tempfile
      file = File.join("public/assets/images", Time.now.to_i.to_s + "_" + params[:avatar].original_filename)
      FileUtils.cp tmp.path, file
      File.chmod(0o755, file)
      if current_user.update(avatar: file)
        render json: {
          user: current_user,
          file: file
        }
      end
    end
  end
end
