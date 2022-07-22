class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(6)
    @total_items = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private
  def item_params
    params.require(:items).permit(:genre_id, :name, :introduction, :price, :is_activ)
  end
end
