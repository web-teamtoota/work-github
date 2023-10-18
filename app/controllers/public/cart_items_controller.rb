class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = CartItem.new
    @cart_items = CartItem.all.page(params[:page]).per(10)
    @cart_item = CartItem.new(params[:id])
    @total_price = 0
    @item = Item.new
    @cart_items = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.with_tax_price * cart_item.amount
      @cart_item = current_customer.orders
    end
  end

  def show
    @cart_item = CartItem.find(params[:id])
    @cart_item = CartItem.new
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_items = CartItem.all
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      cart_item.save
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
    end
  end

  # def create
  #   1. 追加した商品がカート内に存在するかの判別
  #     存在した場合
  #       2. カート内の個数をフォームから送られた個数分追加する
  #     存在しなかった場合
  #       カートモデルにレコードを新規作成する
  # end

  def update
    @cart_item = CartItem.find(params[:id])
    if params[:cart_item][:amount] == "0"
      @cart_item.destroy
      redirect_to cart_item_path
    elsif @cart_item.update(amount: params[:cart_item][:amount])
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
      render :index
    end
    if @cart_item.update(cart_item_params)
      cart_item_path(@cart_item)
    end
    @cart_item = current_customer
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end