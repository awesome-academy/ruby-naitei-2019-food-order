require 'securerandom'

class User < ApplicationRecord
  has_secure_password
  has_many :daily_foods

  class << self
    def create_from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.password = SecureRandom.hex(8)
      end
    end
  end
end
