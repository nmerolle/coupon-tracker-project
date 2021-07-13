class CouponsController < ApplicationController
 before_action :redirect_if_not_logged_in

  def index
    @coupons = Coupon.all
  end

  def new
    @user = current_user
    @coupon = @user.coupons.build
  end

  def create
    @coupon = current_user.coupons.build(coupon_params)
    if @coupon.save
      redirect_to user_coupon_path(@user, @coupon)
    else
      render :new
    end  
  end

  def edit 
    find_coupon
  end

  def update
    find_coupon
    @copuon.update(coupon_params)
    if @coupon.valid?
      redirect_to user_coupons_path
    else
      render :edit 
    end
  end

  def destroy
    find_coupon
    @coupon.destroy
    redirect_to user_coupons_path
  end



  private

  def coupon_params
    params.require(:coupon).permit(:product_name, :expiration_date, :value, :user_id, :store_id)
  end
  
  def find_coupon
    @coupon = Coupon.find_by_id(params[:id])
  end
end
