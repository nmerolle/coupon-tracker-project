class Store < ApplicationRecord
  has_many :coupons
  has_many :users, through: :coupons
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :coupons, reject_if: :missing_atts?

private
  def missing_atts?(att)
    att['product_name'].blank? || att['expiration_date'].blank? || att['value'].blank?
  end

end
