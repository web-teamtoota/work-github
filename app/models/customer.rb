class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :trackable, :validatable
         :recoverable, :rememberable, :validatable

 has_many :cart_items, dependent: :destroy
 has_many :orders

  # is_deletedがfalseならtrueを返すようにしている
  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end



  def full_name
    last_name.to_s + " " + first_name.to_s
  end

  # def set(fname:, lname:)
  #   self.first_name = fname # self.first_name =にする必要がある
  #   self.last_name = lname # self.first_name =にする必要がある
  # end

#customer = Customer.new
#customer.set fname: "Isaac", lname: "Newton"
#p customer.full_name
  # => "Isaac,Newton"

end
