class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = store.new(store_params)
    if @store.save
      redirect_to store_path(@store)
    else
      render :new 
    end
  end


  private

  def store_params
    params.require(:store).permit(:name)
  end

  def find_coupon
    @store = Store.find_by_id(params[:id])
  end

end
