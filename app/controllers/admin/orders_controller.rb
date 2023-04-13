class Admin::OrdersController < ApplicationController


 before_action :authenticate_admin!
  before_action :set_order

  def show; end

  def update
    @order.update(order_params)
    redirect_to admin_order_path(@order), notice: 'Successfully updated order status'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
  
  
  def home
    @orders, @selected = get_orders(params)
    today_orders = Order.created_today
    @today_total_orders = total_orders(today_orders)
    @today_total_sales = total_sales(today_orders)
  end

  private

  def get_orders(params)
    if !params[:status].present? || !Order.statuses.keys.to_a.include?(params[:status])
      return [Order.latest,
              'all']
    end

    get_by_enum_value(params[:status])
  end

  def get_by_enum_value(status)
    case status
    when 'waiting_payment'
      [Order.latest.waiting_payment, 'waiting_payment']
    when 'confirm_payment'
      [Order.latest.confirm_payment, 'confirm_payment']
    when 'shipped'
      [Order.latest.shipped, 'shipped']
    when 'out_of_delivery'
      [Order.latest.out_of_delivery, 'out_of_delivery']
    when 'delivered'
      [Order.latest.delivered, 'delivered']
    end
  end

  def total_orders(orders)
    orders.count
  end

  def total_sales(orders)
    orders.sum(:billing_amount)
  end


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

