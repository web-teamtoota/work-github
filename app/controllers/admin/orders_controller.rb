class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.making_status = "製作待ち"
        order_detail.save
      end
    end
    redirect_to admin_order_path
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
      ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
    end
  end

  private

  def order_params
    params.require(:order).permit(:item_id, :order_id, :quantity, :price, :making_status, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :status)
  end
end
