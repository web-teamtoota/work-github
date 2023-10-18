class Public::CustomersController < ApplicationController
  
  def index
    @customer = Customer.new
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.new
    @customers = Customer.all
  end
  
  def create
    @customer = current_customer.id
    @customers = Customer.all
    @customer.save
    redirect_to customer_path(current_customer.id)
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    end
  end
  
  
  before_action :authenticate_customer!
  
  def unsubscribe; end
    
  def withdraw
    current_customer.update(is_deleted:true)
    reset_session
    redirect_to root_path, notice:
  end

  private

   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
   end
end