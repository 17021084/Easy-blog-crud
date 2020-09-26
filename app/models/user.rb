class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # thằng validate này là hàm nhận parám  nhưng ko cần viết dấu ()
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # has_secure_password
end
