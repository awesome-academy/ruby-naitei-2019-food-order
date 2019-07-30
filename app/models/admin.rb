class Admin < ApplicationRecord
  before_save :username_downcase
  validates :username, presence: true,
                   length: {maximum: Settings.maximum_length_name}
  has_secure_password
  validates :password, presence: true,
                       length: {minimum: Settings.minimum_length_pass}

  def self.digest string
    if cost = ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end

  private

  def username_downcase
    username.downcase!
  end
end
