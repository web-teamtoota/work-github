class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_details.where(making_status: "製作中").count >= 1
      @order.status = "製作中"
      @order.save
    end
    if @order.order_details.count == @order_details.where(making_status: "製作完了").count
      @order.status = "発送準備中"
      @order.save
    end
    redirect_to admin_order_path(@order_detail.order.id)
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_details.where(making_status: 2).count >= 1
      @order.status = 2
      @order.save
    end
    @order_details = @order.order_details.all
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "in_production"
      # ②製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
      # ここから下の内容は③の内容になります。
      # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新させたいので、
      @order_details.each do |order_detail| #紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
        if order_detail.making_status != "production_complete" # 製作ステータスが「製作完了」ではない場合
          is_updated = false # 上記で定義してあるis_updatedを「false」に変更する。
        end
      end
      @order.update(status: 3) if is_updated
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status, :item_id, :order_id, :quantity, :price)
  end
end