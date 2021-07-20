class Store < ApplicationRecord
  has_many :coupons
  has_many :users, through: :coupons
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :coupons, reject_if: :all_blank
end
