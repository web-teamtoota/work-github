class Public::ItemsController < ApplicationController

 def top
   @item = Item.new
 end

  def index
    @item = Item.new
    @items = Item.all.page(params[:page]).per(4)
  end
  

  def show
    @item = Item.find(params[:id])
  end

    private
   def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
   end

end


