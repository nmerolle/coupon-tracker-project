class CouponsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :find_store, only: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :deny_access

  def index
    if params[:store_id] && @store = Store.find(params[:store_id])
      @coupons = @store.coupons
    else
      @coupons = current_user.coupons
      @expired = @coupons.expired_coupon
    end
  end

  def new
    if params[:store_id] && @store = Store.find(params[:store_id])
      @coupon = @store.coupons.build
      render :new_store_coupon
    else
      @user = current_user
      @coupon = @user.coupons.build
    end
  end

  def create
    @coupon = current_user.coupons.build(coupon_params)
    if @coupon.save
      if @store
        redirect_to store_coupons_path(@store)
      else
        redirect_to coupon_path(@coupon)
      end
    else
      if @store
        render :new_store_coupon
      else
        render :new
      end
    end  
  end

  def show
    find_coupon
  end

  def edit
    find_coupon
  end

  def update
    find_coupon
    @coupon.update(coupon_params)
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
    params.require(:coupon).permit(:product_name, :expiration_date, :value, :user_id, :store_id, store_attributes: [:name])
  end
  
  def find_coupon
    @coupon = Coupon.find_by_id(params[:id])
  end

  def find_store
    if params[:store_id]
      @store = Store.find_by_id(params[:store_id])
    end
  end
end
