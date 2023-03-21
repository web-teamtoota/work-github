class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  
  end
  
  def create
  @item = Item.new(item_params)
  @items = Item.all
  @item.save
   redirect_to admin_item_path(@item.id)
  end



  def edit
    @item = Item.find(params[:id])
  end

  def update
  end
  
    private
   def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
   end



end