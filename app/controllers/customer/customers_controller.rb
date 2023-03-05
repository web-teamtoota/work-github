class Customer::CustomersController < ActionController
  def index
    @customer = Customer.all
  end
  
   def new
    @customer = Customer.all
   end
  
  
end
  