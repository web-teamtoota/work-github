class OrderDetail < ApplicationRecord

   # devise :database_authenticatable, :registerable,
   #       :recoverable, :rememberable, :validatable

belongs_to :order
belongs_to :item

  # enum payment_method: { credit_card: 0, transfer: 1 }
#   enum making_status: { cannot_be_started: 0, awaiting_manufacture: 1, under_manufacture: 2, completed_production: 3 }
  
#   enum making_status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }
#making_status → 製作ステータス

  enum making_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

end


