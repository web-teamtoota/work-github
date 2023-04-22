class OrderDetail < ApplicationRecord

   # devise :database_authenticatable, :registerable,
   #       :recoverable, :rememberable, :validatable

belongs_to :order
belongs_to :item

  # enum payment_method: { credit_card: 0, transfer: 1 }
  enum making_status: { cannot_be_started: 0, awaiting_manufacture: 1, under_manufacture: 2, completed_production: 3 }
end
