class CartItem < ApplicationRecord
#  devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable

    #belongs_to :item, :counter_cache => true
#   belongs_to :article, counter_cache: :admin_comments_count

  belongs_to :item#, optional: true
  belongs_to :customer

validates :item_id, :amount, presence: true
validates :amount, numericality:{ only_integer: true }

  # def sum_of_price
  #   item.taxin_price * quantity
  # end

# def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
#   item.taxin_price*quantity
# end

#   belongs_to :product

  ## 消費税を求めるメソッド
def with_tax_price
    (price * 1.1).floor
end

## 小計を求めるメソッド
def subtotal
    with_tax_price * amount
end
end
