class Coupon < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :product_name, :expiration_date, :value, presence: true
  accepts_nested_attributes_for :store, reject_if: :all_blank
  scope :expired_coupon, -> {where("expiration_date < ?", Date.today)}

  def store_name
     self.store.name if self.store
  end
end
