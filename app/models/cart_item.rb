class CartItem < ApplicationRecord
  
  ## 消費税を求めるメソッド
def with_tax_price
    (price * 1.1).floor
end

## 小計を求めるメソッド
def subtotal
    item.with_tax_price * amount
end


end
