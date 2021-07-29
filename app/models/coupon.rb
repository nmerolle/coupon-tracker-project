class Coupon < ApplicationRecord
  belongs_to :user
  belongs_to :store
  accepts_nested_attributes_for :store, reject_if: :all_blank

  def store_name
     self.store.name if self.store
  end
end
