class Store < ApplicationRecord
  has_many :coupons
  has_many :users, through: :coupons
  accepts_nested_attributes_for :coupons, reject_if: :all_blank
end
