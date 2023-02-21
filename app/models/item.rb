class Item < ApplicationRecord
belongs_to :genre

validates :is_active,presence: true
end