class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, length: { maximum: 5 }
  validates :first_name, presence: true, length: { maximum: 10 }

 def full_name
   p "+++++"
   p self.id
   self.last_name + " " + self.first_name
 end

end
