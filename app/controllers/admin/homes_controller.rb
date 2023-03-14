class Admin::HomesController < ApplicationController

def top
      @item = Item.new
    @items = Item.page(params[:page]).per(10)
    
 end

    private
   def item_params
    params.require(:item).permit(:created_at, :name, :quantity, :status, :introduction, :price)
   end
 
end
