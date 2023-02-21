class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save
    redirect_to lists_path
  end


  def index
    
    @lists = List.page(params[:page])
    @lists = List.all
  end

  def show
   @list = List.find(params[:id])
   @lists = @list.Users.page(params[:page])
  end

  def edit
  end
  

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to '/lists'
  end
    
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
  
  
end
