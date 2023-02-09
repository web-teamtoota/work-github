class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
   @post_images = @user.lists.page(params[:page])
  end
  
  def edit
  end
end