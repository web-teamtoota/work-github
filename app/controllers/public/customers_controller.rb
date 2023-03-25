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
  #@customer = Customer.new(customer_params)
  @customer = current_customer.id
  @customers = Customer.all
  @customer.save
  redirect_to customer_path(current_customer.id)
 end
  
  
  def edit
       @customer == current_customer
  end

  def update
     @customer = Customer.find(params[:id])
      @customer.update(customer_params)
       redirect_to customer_path(@customer.id)
    
  end
  
  
  before_action :authenticate_customer!

  def unsubscribe; end

  def withdraw
    current_customer.update(is_deleted:true)
    reset_session
    redirect_to root_path, notice: 'Successfully withdraw from Ecommerce'
  end
end

#   def withdrawal
#     @customer = Customer.find(params[:id])
#     # is_deletedカラムをtrueに変更することにより削除フラグを立てる
#     @customer.update(is_deleted: true)
#     reset_session
#     flash[:notice] = "退会処理を実行いたしました"
#     redirect_to root_path
#   end

#???いる？
  # def withdraw
  #   #@customer = Customer.find(params[:id])
  #   # is_deletedカラムをtrueに変更することにより削除フラグを立てる
  #   @customer.update(is_deleted: true)
  #   reset_session
  #   flash[:notice] = "退会処理を実行いたしました"
  #   redirect_to root_path
  # end
  

  private
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
   end
