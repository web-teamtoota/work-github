class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def full_name
    self.last_name + " " + self.first_name
  end
  

  attr_accessor :first_name, :last_name

  def full_name
    first_name.to_s + "," + last_name.to_s
  end

  def set(fname:, lname:)
    self.first_name = fname # self.first_name =にする必要がある
    self.last_name = lname # self.first_name =にする必要がある
  end
end

 customer =  Customer.new
 customer.set fname: "Isaac", lname: "Newton"
p  customer.full_name
  # => "Isaac,Newton"