class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
    3.times {@store.coupons.build}
    
  end

  def create
    @store =Store.new(store_params)
    if @store.save
      redirect_to coupons_path
    else
      flash.now[:error] = @store.errors.full_messages
      render :new 
    end
  end

  def show
    find_store

  end


  private

  def store_params
    params.require(:store).permit(:name, coupons_attributes: [:product_name, :expiration_date, :value, :user_id, :store_id])
  end

  def find_store
    @store = Store.find_by_id(params[:id])
  end

end
