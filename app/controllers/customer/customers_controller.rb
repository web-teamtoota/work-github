class Customer::CustomersController < ApplicationController
  def index
   
      @customer = Customer.find(params[:id])
  end
  
   def new
      @customer = Customer.find(params[:id])
    @customer = Customer.all
   end
   
   def create
     @customer = Customer.new(params[:id])
   end
  
    private
   def customer_params
    params.require(:customer).permit(:last_name, :first_name)
   end
  
  
end
  