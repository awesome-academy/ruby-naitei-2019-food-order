module Api
  class CommentsController < ApplicationController
    before_action :authorize_access_request!
    include SessionsHelper
    include ActionController::Cookies

    def index
      food_id = params["food_id"]
      if !food_id.nil?
        food = Food.find_by id: food_id
        comments = food.comments
        responses = []
        comments.each do |c|
          user = User.find_by id: c.user_id
          user_avatar = !user.nil? ? user.avatar : ""
          user_name = !user.nil? ? user.last_name : ""
          res = {
            user_avatar: user_avatar,
            user_name: user_name,
            comment: c
          }
          responses.unshift res
        end
        render json: {
          comments: responses
        }
      else
        render json: {
          comments: []
        }
      end
    end

    def save
      food_id = params["food_id"]
      if !food_id.nil?
        current_user_id = current_user.id
        comment = Comment.new
        text = !params["comment"].nil? ? params["comment"] : ""
        comment.food_id = food_id
        comment.comment = text
        comment.user_id = current_user_id
        if comment.save!
          render json: {
            comment: comment,
            status: true
          }
        else
          render json: {
            comment: {},
            status: false
          }
        end
      else
        render json: {
          comment: {},
          status: false
        }
      end
    end

    def update
      comment_id = params["comment_id"]
      if !comment_id.nil?
        comment = Comment.find_by id: comment_id
        if !comment.nil?
          if current_user.id != comment.user_id
            render json: {
              status: false
            }
          else
            text = params["comment"]
            comment.comment = text ? text : comment.comment
            comment.save
            render json: {
              comment: comment,
              status: true
            }
          end
        else
          render json: {
            status: false
          }
        end
      else
        render json: {
          status: false
        }
      end
    end

    def destroy
      comment_id = params["comment_id"]
      if !comment_id.nil?
        comment = Comment.find_by id: comment_id
        if !comment.nil?
          if current_user.id != comment.user_id
            render json: {
              status: false
            }
          else
            comment.destroy
            render json: {
              status: true
            }
          end
        else
          render json: {
            status: false
          }
        end
      else
        render json: {
          status: false
        }
      end
    end
  end
end
