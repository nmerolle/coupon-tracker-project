class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = current_user.coupons.build(coupon_params)
    if @coupon.save
      redirect_to coupons_path
    else
      render :new
    end  
  end

  def edit 
    find_coupon
  end

  def update
    find_coupon
    @copuon.update(coupn_params)
    if @coupon.valid?
      redirect_to coupons_path
    else
      render :edit 
    end
  end

  def destroy
    find_coupon
    @coupon.destroy
    redirect_to coupons_path
  end



  private

  def coupon_params
    params.require(:coupon).permit(:product_name, :expiration_date, :value)
  end
  
  def find_coupon
    @coupon = Coupon.find(params[:id])
  end
end
