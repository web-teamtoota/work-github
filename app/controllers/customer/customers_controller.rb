class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def withdraw
    current_customer.update(status: "withdrawn")
    reset_session
    redirect_to root_path
  end

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
