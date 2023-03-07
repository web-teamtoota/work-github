class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new(params[:id])
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
  end
  
    private
   def item_params
    params.require(:item).permit(:name, :introduction, :price)
   end



end