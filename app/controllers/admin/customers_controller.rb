class Admin::CustomersController < ApplicationController

  def index
    # @customer = Customer.new
    @customers = Customer.all.page(params[:page]).per(10)
    # @users = User.all
  end

  def show
    #   @customer = Customer.new
    # @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to admin_customer_path(@customer)
  end


  private
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
   end

end