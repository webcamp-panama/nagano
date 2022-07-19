class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
    @item_page = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @items = Item.all
    @item = Item.new(item_params)
    if @item.save
       redirect_to admin_items_path(@item)
    else
       render :index
    end
  end



  def show
    @item = Item.find(params[:id])
  end



  def edit
    @item = Item.find(params[:id])
  end



  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :introduction)
  end



end


