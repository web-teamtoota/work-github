class CustomersController < ActionController::Base

  def index
    @users = User.all
  end
  
   def new
    @users = User.all
   end
  
  
end
  