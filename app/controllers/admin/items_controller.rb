class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item = Item.all
    @item.save
   redirect_to admin_items_path(@item)
  end

  def show
      @item = Item.find(params[:id])
  end

  def edit
      @item = Item.find(params[:id])
  end

  def update
  end

  private
  def item_params
   params.require(:item).permit(:profile_image, :id, :genre_id, :price, :is_active)
  end

end


