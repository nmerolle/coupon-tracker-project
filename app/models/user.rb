class User < ApplicationRecord
  has_secure_password
  validates :username, :email,  presence: true
  validates :email, uniqueness: true
  has_many :coupons
end
