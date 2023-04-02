class Item < ApplicationRecord
 has_one_attached :image

  has_many :cart_items
   #has_many :cart_items, dependent: :destroy
has_many :orders


# has_many :order_items

# def taxin_price
#         price*1.1
# end
    
    
#  def add_tax_price
#         (self.price * 1.1).round
#  end
 
 
 
  
 # def with_tax_price
   
 #  (price_previous_change
 #   #price_excluding_tax * 1.1
 #   )
 # end
 
 
 def with_tax_price
    (price * 1.1).floor
 end

end