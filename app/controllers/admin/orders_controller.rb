class Admin::OrdersController < ApplicationController

  def index
     @order = Order.new
  end

  def show
      @order = Order.find(params[:id])
  end

  def update
  end
  
  
    private
   def order_params
    params.require(:order).permit(:item_id, :order_id, :quantity, :price, :making_status)
   end

  
  
end

