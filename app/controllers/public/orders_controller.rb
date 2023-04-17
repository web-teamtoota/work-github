class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!


  def index
    @order = Order.new
    @orders = Order.all.page(params[:page]).per(10)
    # # params[:order][:address_option]
    # @order.postal_code = customer.postal_code
    # @order.address = customer.address
    # @order.name = customer.last_name + customer.first_name
    # @item.name = current_customer.name
  end


   def show
     #@order = Order.new(params[:id])
     @order = Order.find(params[:id])
     @order_details = @order.order_details.all

    # @order = Order.find(params[:id])
    # @order_details = @order.order_details.all
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
  @order = Order.new
  @customer = current_customer
  @orders = current_customer.cart_items
  @customer = Customer.find(current_customer.id)
  #@addresses = current_customer.addresses

end


def create
      # @order = Order.new(order_params)
      #@item = Item.find(params[:item_id])
    #@order = @item.order.new(order_params)
  cart_items = current_customer.cart_items.all
  @order = current_customer.orders.new(order_params)
  if @order.save
    cart_items.each do |cart_item|
      @order_item = OrderDetail.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.quantity = cart_item.amount
      @order_item.price = cart_item.item.price
      @order_item.making_status = 0
      @order_item.save
    end
    redirect_to orders_thanks_path
    cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end
end




  # def create
  #   @order = Order.new(order_params)
  #   @order.customer_id = current_customer.
  #   @order = current_customer.new(order_params)
  #   if @order.save

  #     @cart_items = current_user.cart_items.all
  #   @cart_items.each do |cart_item|
  #       @order_items = @order.order_items.new
  #       @order_items.item_id = cart_item.item.id
  #       @order_items.name = cart_item.item.name
  #       @order_items.price = cart_item.item.price
  #       @order_items.quantity = cart_item.quantity
  #       @order_items.save
  # current_user.cart_items.destroy_all

  #   end



  #     @cart_items = current_customer.cart_items
  #     @cart_items.each do |cart_item|
  #       order_detail = OrderDetail.new(order_id: @order.id)
  #       order_detail.price = cart_item.item.price
  #       order_detail.amount = cart_item.amount
  #       order_detail.item_id = cart_item.item_id
  #       order_detail.save!
  #     end
  #     @cart_products.destroy_all
  #     redirect_to cart_items_path
  #   else
  #     render "new"
  #   end
  # end




# #下正しいはず
# def create
#     @order = Order.new(order_params)
#     @order = Order.find(params[:id])
#     #@item = Item.find(params[:item_id])
#     @order = @item.order.new(order_params)
#     @order.save
#     redirect_to items_path

#   cart_items = current_customer.cart_items.all
#   @order = current_customer.orders.new(order_params)
#   if @order.save
#     cart_items.each do |cart|
#       @cart_item = Cartitem.new
#       @order_item = OrderItem.new
#       @order_item.item_id = cart.item_id
#       @order_item.order_id = @order.id
#       @order_item.order_quantity = cart.quantity
#       @order_item.order_price = cart.item.price
#       @order_item.save
#     end
#     redirect_to cart_items_path
#     cart_items.destroy_all
#   else
#     @order = Order.new(order_params)
#     render :new
#   end
# end


# private

# def order_params
#   params.require(:order).permit(:name, :address, :total_price)
# end

# def address_params
#   params.require(:order).permit(:name, :address)
# end



  # def confirm
  #   @item = Item.find(params[:item_id])
  #   @order = @item.order.new(order_params)
  #   @order = Order.new
  #   @cart_items = current_customer.cart_items
  #   @order.shipping_cost = 800
  #   @total_price = 0
  #   @cart_items.each do |cart_item|
  #   @total_price += cart_item.item.with_tax_price*cart_item.amount
  #   end
  #   @order.total_payment = @total_price + @order.shipping_cost
  #   @order.payment_method = params[:order][:payment_method]



  #   # @order = Order.new(event_params)
  #   # if @order.invalid? #入力項目に空のものがあれば入力画面に遷移
  #   #   render :new
  #   # end
  # end


  # def create
		# @order = Order.new(order_params)
		# # @order.current_customer = current_customer
		# @order.total = params[:order][:total]
		# @order.order_status = params[:order][:order_status]
		# @order.payment = params[:order][:payment]
		# @order.order_status = params[:order][:order_status]
		# if params[:order][:address_option] == "0"
		# 	@order.postal_code = current_end_user.postal_code
		# 	@order.order_address = current_end_user.address
		# 	@order.dear_name = current_end_user.first_name + current_end_user.last_name
		# elsif params[:order][:address_option] == "1"
		# 	@order.postal_code = params[:order][:postal_code]
		# 	@order.order_address = params[:order][:order_address]
		# 	@order.dear_name = params[:order][:dear_name]

		# elsif params[:order][:address_option] == "2"
		# 	@order.postal_code = params[:order][:postal_code]
		# 	@order.order_address = params[:order][:address]
		# 	@order.dear_name = params[:order][:dear_name]
		# end
		# # binding.pry

		# if	@order.save
		# 	redirect_to orders_thanks_path
		# else
		# 	flash[:danger] = "カートが空です。"
		# 	redirect_to root_path
		# end

  # end



   def confirm
     #byebug
    @cart_items = current_customer.cart_items
    #@order = Order.new(
      #customer_id: @current_user,
      #customer_id: @posted_id
      #)

    #@order = Order.new(order_params)
    # @order = Order.new(orders_path)
    #@order.customer_id = current_customer.id
    #@order.payment_method = params[:order][:payment_method]
    @total_price = 0
    @cart_items = current_customer.cart_items

    @order = Order.new(order_params)
    if params[:order][:city_option] == "0"
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
    end

    @cart_items.each do |cart_item|
    @total_price += cart_item.item.with_tax_price
    end

    @order.postage = 800
    @order.total_payment = @total_price + @order.postage

    if params[:order][:address_option] == "0"
      @order.postage=  current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:address_option] == "1"
      @ship_address = Address.find(params[:order][:id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @ship_address.name
      render 'confirm'
    elsif params[:order][:address_option] == "2"
      @address = current_customer.ship_cities.new
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.postcode = params[:order][:postcode]
      @address.customer_id = current_customer.id
      if @address.save
      @order.postcode = @address.postcode
      @order.name = @address.name
      @order.address = @address.address
      else
       render 'new'
      end
    end
   end







  # def confirm
  #   @cart_items = current_customer.cart_items
  #   @order = Order.new(order_params)

  #   @order.postage = current_customer.postal_code
  #   @order.address = current_customer.address
  #   @order.name = current_customer.first_name + current_customer.last_name

  #   @address = Address.find(params[:order][:address_id])
  #   @order.postal_code = @address.postal_code
  #   @order.address = @address.address
  #   @order.name = @address.name
  #       binding.pry
  #   @order.customer_id = current_customer.id
  #   @order.payment_method = params[:order][:payment_method]
  #   # @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
  #   # @order.shipping = 800

  #   if params[:order][:city_option] == "0"
  #     #@order.postal_code = current_customer.postal_code
  #     #@order.city = current_customer.city
  #     @order.name = current_customer.last_name + " " + current_customer.first_name
  #     render 'confirm'
  #   elsif params[:order][:city_option] == "1"
  #     @ship_city = ShipCity.find(params[:order][:id])
  #     @order.postcode = @ship_city.postcode
  #     @order.city = @ship_city.city
  #     @order.name = @ship_city.name
  #     render 'confirm'
  #   elsif params[:order][:city_option] == "2"
  #     @ship_city = current_customer.ship_cities.new
  #     @ship_city.city = params[:order][:city]
  #     @ship_city.name = params[:order][:name]
  #     @ship_city.postcode = params[:order][:postcode]
  #     @ship_city.customer_id = current_customer.id
  #     if @ship_city.save
  #     @order.postcode = @ship_city.postcode
  #     @order.name = @ship_city.name
  #     @order.city = @ship_city.city
  #     else
  #     render 'new'
  #     end
  #   end
  # end




# def confirm
#   @order = Order.find(params[:confirm])
# end


  def thanks
  end



  private
   def order_params
     params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
   end

end