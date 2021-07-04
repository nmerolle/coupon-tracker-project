class User < ApplicationRecord
  has_secure_password

  def new
    @user = User.new
  end

  def create
  end
end
