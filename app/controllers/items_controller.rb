class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit, :update]
  before_action :authenticate_farmer!, except: [:index, :show]
  before_action :item_info, only: [:edit, :show, :update]
  before_action :item_authenticate, only: [:edit, :update]

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
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :contents, :category_id, :prefecture_id, :delivery_id, :shipping_id, :price).merge(farmer_id: current_farmer.id)
  end

  def item_info
    @item = Item.find(params[:id])
  end

  def item_authenticate
    unless @item.farmer == current_farmer
      redirect_to root_path
    end
  end
end
