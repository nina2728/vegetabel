class PurchaseItemsController < ApplicationController
  
  def index
    @order = Order.new
  end
  
  def create
    @order = Order.create(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name).merge(:user_id current_user.id)
  end
end
