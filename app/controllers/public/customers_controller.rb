class Public::CustomersController < ApplicationController
  
  
  
  def index
    @customer = Customer.new
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.new
    @customers = Customer.all
  end

  def edit
       @customer == current_customer
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :unsubscribe)
   end

end