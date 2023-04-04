class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @order = Order.new
    @orders = Order.all.page(params[:page]).per(10)
  end


   def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
      # @order = Order.new
    @orders = Order.all
    @order = Order.find_by(id: params[:id])
      # @order = Order.find(params[:id])
      # @order = Order.find(params[:order_id])
      
    # @order_details = @order.order_details.all
    # @ordering_details= @order.ordering_details
    # @order.shipping_cost = 800
    @total_price = 0
    # @ordering_details.each do |ordering_detail|
    # @total_price += ordering_detail.item.add_tax_price*ordering_detail.amount
    # end
    # @order.total_payment = @total_price + @order.shipping_cost
   end




def new
  @order = Order.
end

def create 
      @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    @order.save
    redirect_to items_path
  
  
  
  cart_items = current_customer.cart_items.all
  @order = current_customer.orders.new(order_params)
  if @order.save
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_quantity = cart.quantity
      order_item.order_price = cart.item.price
      order_item.save
    end
    redirect_to cart_items_path
    cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end
end

def check
  @order = Order.new(order_params)
  if params[:order][:address_number] == "1"
    @order.name = current_customer.name 
    @order.address = current_customer.customer_address
  elsif params[:order][:address_number] == "2"
    if Address.exists?(name: params[:order][:registered])
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    address_new = current_customer.addresses.new(address_params)
    if address_new.save 
    else
      render :new
    end
  else
    redirect_to cart_items_path
  end
  @cart_items = current_customer.cart_items.all
  @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
end

private

def order_params
  params.require(:order).permit(:name, :address, :total_price)
end

def address_params
  params.require(:order).permit(:name, :address)
end



  def confirm
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total_price = 0
    @cart_items.each do |cart_item|
     @total_price += cart_item.item.with_tax_price*cart_item.amount
    end
    @order.total_payment = @total_price + @order.shipping_cost
    @order.payment_method = params[:order][:payment_method]

    
    
    # @order = Order.new(event_params)
    # if @order.invalid? #入力項目に空のものがあれば入力画面に遷移
    #   render :new
    # end
  end

# def confirm
#   @order = Order.find(params[:confirm])
# end


  def thanks
  end

  private
   def order_params
    params.require(:order).permit(:id, :customer_id, :postal_code, :address, :name, :total_payment,:postage, :payment_method, :status)
   end

end


end
