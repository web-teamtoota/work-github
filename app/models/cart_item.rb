class CartItem < ApplicationRecord
#  devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable

  has_many_attached :image
  belongs_to :item
  belongs_to :customer

validates :item_id, :amount, presence: true
validates :amount, numericality:{ only_integer: true }

## 小計を求めるメソッド
def subtotal    
  item.with_tax_price * amount
end

end