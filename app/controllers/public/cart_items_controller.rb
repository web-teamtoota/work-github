class Public::CartItemsController < ApplicationController


  def index
    @cart_item = CartItem.new
    @cart_items = CartItem.all
    @cart_items = CartItem.all.page(params[:page]).per(10)

  end

    def create
        #binding.pry
        @cart_item = CartItem.new(cart_item_params)
        @cart_items = CartItem.all
        @cart_item.save
        redirect_to cart_item_path(@cart_item.id)
         #@cart_item = CartItem.find(cart_item_params[:item_id])
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

  end



      private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
