class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(6)
    @total_items = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def add_tax_on_price
   (self.price * 1.10).round
  end
end
