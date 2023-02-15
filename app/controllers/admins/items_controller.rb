class Admins::ItemsController < ApplicationController
  def index
  end

  def new
      @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
   redirect_to admin_items_path(@item.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  private
   def item_params
    params.require(:item).permit(:profile_image, :id, :price, :sale, :faculty)
   end

end
