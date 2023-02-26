class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
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
   params.require(:item).permit(:image, :name, :introduction, :price, :is_active)
  end

end


