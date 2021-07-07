class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_farmer!, except: [:index, :show]

  def index
    @items = Item.includes(:farmer).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :contents, :category_id, :prefecture_id, :delivery_id, :shipping_id, :price).merge(farmer_id: current_farmer.id)
  end
end
