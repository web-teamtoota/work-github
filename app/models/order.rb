class Order < ApplicationRecord
   # devise :database_authenticatable, :registerable,
   #       :recoverable, :rememberable, :validatable

has_many :order_items
belongs_to :customer
has_many :addresses
    
    # Order.all.sum(:price)
    # enum sales_order_status:{入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

   enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}


#   belongs_to :customer
#   enum status: {
#     入金待ち: 0,
#     入金確認: 1,
#     製作中: 2,
#   発送準備中: 3,
#     発送済み: 4
#   }
  has_many :order_details, dependent: :destroy

#  scope :waiting_payment, -> { where(status: 'waiting_payment') }
#  scope :confirm_payment, -> { where(status: 'confirm_payment') }
#  scope :shipped, -> { where(status: 'shipped') }
#  scope :out_of_delivery, -> { where(status: 'out_of_delivery') }
#  scope :delivered, -> { where(status: 'delivered') }
#  scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }
 
#  scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }


end


