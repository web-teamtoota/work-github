class Admin::CustomersController < ActionController::Base

  def index
    @customer = Customer.new
    @customers = Customer.all.page(params[:page]).per(10)
    @users = User.all
  end

  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end


  private
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number)
   end

end