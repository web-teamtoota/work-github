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
    first_name.to_s + "名前" + last_name.to_s
  end

 def set(fname:, lname:)
    self.first_name = fname # self.first_name =にする必要がある
    self.last_name = lname # self.first_name =にする必要がある
 end


 customer =  Customer.new
 customer.set fname: "Isaac", lname: "Newton"
 p  customer.full_name
  

end

def nil_guard( val=nil )
  val ||= "default"
end

p nil_guard( false )
  # "default"

p nil_guard( "test" )
  # "test"
  
  
def required_keyword_args(first_name:, last_name:, age: nil)
  "#{first_name}, #{last_name} (#{age.to_s})"
end

p required_keyword_args()
  # ArgumentError
p required_keyword_args(first_name: "Isaac")
  # ArgumentError
p required_keyword_args(first_name: "Isaac", last_name: "Newton")
  # "Isaac, Newton ()"
p required_keyword_args(first_name: "Isaac", last_name: "Newton", age: 30)
  # "Isaac, Newton (30)"