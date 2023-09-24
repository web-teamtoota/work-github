class Admin::HomesController < ApplicationController
  def index
    @items = Item.all
  end

  def top
    @order = Order.new
    @orders = Order.page(params[:page]).per(10)
    @customer = Customer.new
    @customers = Customer.all
  end

  private

  def item_params
    params.require(:home).permit(:id, :name, :introduction, :price, :is_active)
  end
end
