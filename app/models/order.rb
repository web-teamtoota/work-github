class Order < ApplicationRecord
   # devise :database_authenticatable, :registerable,
   #       :recoverable, :rememberable, :validatable


belongs_to :customer
has_many :order_details, dependent: :destroy
has_many :items, through: :order_details




    # Order.all.sum(:price)
    # enum sales_order_status:{入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}
  
  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
#status → 注文ステータス

#   enum status: {
#     入金待ち: 0,
#     入金確認: 1,
#     製作中: 2,
#   発送準備中: 3,
#     発送済み: 4
#   }


#  scope :waiting_payment, -> { where(status: 'waiting_payment') }
#  scope :confirm_payment, -> { where(status: 'confirm_payment') }
#  scope :shipped, -> { where(status: 'shipped') }
#  scope :out_of_delivery, -> { where(status: 'out_of_delivery') }
#  scope :delivered, -> { where(status: 'delivered') }
#  scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }

#  scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }



  # validates :postal_code, presence: true
  # validates :address, presence: true
  # validates :name, presence: true

  # def self.cart_items_total_price(cart_items)
  #   array = []
  #   cart_items.each do |cart_item|
  #     array << cart_item.item.price * cart_item.amount
  #   end
  #   return (array.sum * 1.1).floor
  # end
  
  # def subtotal
  #   item.with_tax_price * amount
  # end

end

  