class PurchaseItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_info
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_info
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
