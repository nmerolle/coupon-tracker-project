class User < ApplicationRecord
  has_many :coupons
  has_many :stores, through: :coupons
  has_secure_password
  validates :username, :email,  presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 3}
  validate :is_email?


  def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "please enter a vailid e-mail")
    end 
  end 

end
