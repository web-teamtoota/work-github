class Admin::ItemsController < ApplicationController
  
  def index
    @item = Item.new
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @items = Item.all
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "show"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end
end