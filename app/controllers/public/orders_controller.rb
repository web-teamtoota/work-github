class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @order = Order.new
    @orders = Order.all.page(params[:page]).per(10)
    @total_payment = 0

    @total_payment = @order.total_payment
    @customer = current_customer.id
    @customer = Customer.new
    @customers = Customer.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @orders = Order.all
    @order = Order.find_by(id: params[:id])

    @customer = current_customer.id
    @customer = Customer.new
    @customers = Customer.all
  end

  def new
    @order = Order.new
    @customer = current_customer
    @cart_items = current_customer.cart_items

    if @cart_items.empty?
      redirect_to cart_items_path
    end
  end

  def create
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

  def confirm
    @cart_items = current_customer.cart_items

    @order = Order.new(order_params)
    if params[:order][:city_option] == "0"
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
    end

    @order.postage = 800

    if params[:order][:address_option] == "0"
      @order.postage = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render "confirm"
    elsif params[:order][:address_option] == "1"
      @ship_address = Address.find(params[:order][:id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @ship_address.name
      render "confirm"
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
        render "new"
      end
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
  end
end