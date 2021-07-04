class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to coupons_path
    else
      redirect_to 'login'
    end
  end

  def home
  end

  def destroy
    session.clear
    redirect_to '/'
  end



end
