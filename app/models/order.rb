class Order < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

belongs_to :customer
has_many :order_items
  
  
end
