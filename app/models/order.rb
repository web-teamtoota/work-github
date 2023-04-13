class Order < ApplicationRecord
   # devise :database_authenticatable, :registerable,
   #       :recoverable, :rememberable, :validatable

belongs_to :customer
has_many :order_items

  # enum payment_method: { credit_card: 0, transfer: 1 }
  # enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}


  belongs_to :customer
  enum status: {
    waiting_payment: 0,
    confirm_payment: 1,
    shipped: 2,
    out_of_delivery: 3,
    delivered: 4
  }
  has_many :order_details, dependent: :destroy

 scope :waiting_payment, -> { where(status: 'waiting_payment') }
 scope :confirm_payment, -> { where(status: 'confirm_payment') }
 scope :shipped, -> { where(status: 'shipped') }
 scope :out_of_delivery, -> { where(status: 'out_of_delivery') }
 scope :delivered, -> { where(status: 'delivered') }
 scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }
 
 scope :created_today, -> { where('orders.created_at >= ?', Time.zone.now.beginning_of_day) }


end


