class Public::CartItemsController < ApplicationController


  def index
    @cart_item = CartItem.new
    @cart_items = CartItem.all.page(params[:page]).per(10)
    @cart_item = CartItem.new(params[:id])
    @total_price = 0
    @item = Item.new


    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
    @total_price += cart_item.item.with_tax_price*cart_item.amount
    end

  end




    def new
        @cart_item = CartItem.new
    end



    def create
        #binding.pry
        @cart_items = CartItem.all
        # if @cart_item.save
        #   redirect_to cart_items_path(@cart_item.id)
        # else
        #   @cart_item = CartItem.new(params[:id])
        # #@cart_item = CartItem.find(cart_item_params[:item_id])
    cart_item=CartItem.new(cart_item_params)
    cart_item.customer_id=current_customer.id
    cart_item.save

    # cart_item = CartItem.new(cart_item_params)
    #@cart_item.customer_id = current_customer
    # cart_item.end_user_id = current_end_user.id
    # @cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      cart_item.save
      redirect_to cart_items_path(cart_item.id)
    else
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    # .save cart_item
      redirect_to cart_items_path
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
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)

    redirect_to  cart_items_path(cart_item.id)

end


def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
end


 def destroy_all
    cart_items = current_customer.cart_items
    CartItem.destroy_all
    redirect_back(fallback_location: root_path)
    #redirect_to cart_items_path(cart_items.id)
 end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
