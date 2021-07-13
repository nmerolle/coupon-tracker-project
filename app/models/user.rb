class User < ApplicationRecord
  has_many :coupons
  has_many :stores, through: :coupons
  has_secure_password
  validates :username, :email,  presence: true
  validates :email, uniqueness: true
  accepts_nested_attributes_for :coupons
end
