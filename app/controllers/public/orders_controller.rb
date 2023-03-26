class Public::OrdersController < ApplicationController

  def index
    @order = Order.new
    @orders = Order.all.page(params[:page]).per(10)
  end


  def show
    @order = Order.find(params[:id])
  end

def new
end


def confirm
   @order = Order.find(params[:confirm])
end



  private
   def item_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :total_payment,:postage, :payment_method, :status)
   end

end
