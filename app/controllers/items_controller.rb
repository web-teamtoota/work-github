class ItemsController < ApplicationController
  
  def index
    @item = Item.new
    @items = Item.all.page(params[:page]).per(8)
  end
  

  def show
    @item = Item.find(params[:id])
  end

end