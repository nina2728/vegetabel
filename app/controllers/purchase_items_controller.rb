class PurchaseItemsController < ApplicationController
  
  def index
    @order = Order.new
  end
  
end
