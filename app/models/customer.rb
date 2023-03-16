class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attr_accessor :first_name, :last_name

def full_name
  last_name.to_s + first_name.to_s #nil.to_sは空文字を返す
end 



  def full_name
    first_name.to_s + "氏名" + last_name.to_s
  end

  def set(fname:, lname:)
    self.first_name = fname # self.first_name =にする必要がある
    self.last_name = lname # self.first_name =にする必要がある
  end


customer = Customer.new
customer.set fname: "Isaac", lname: "Newton"
p customer.full_name
  # => "Isaac,Newton"

end
