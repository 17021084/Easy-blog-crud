class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = email.downcase }

  # thằng validate này là hàm nhận parám  nhưng ko cần viết dấu ()
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # ============== static method =======================
  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Password.create(string, cost: cost)
           end
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  # ============== static method =======================

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget 
    update_attribute(:remember_digest, nil)
  end
end
