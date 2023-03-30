class Public::ItemsController < ApplicationController

 def top
   @item = Item.limit(4).order('id DESC')
    @items = Item.all
   
 end

  def index
    @item = Item.new
    @items = Item.page(params[:page]).per(8)
    
  end
  
  

  def new
      
    @item = Item.new(params[:id])
  end
  
  
  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
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
