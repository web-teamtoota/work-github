class Public::OrdersController < ApplicationController

  def index
    @order = Order.new
    @orders = Order.all.page(params[:page]).per(10)
  end


  def show
    @order = Order.find(params[:id])
  end

end