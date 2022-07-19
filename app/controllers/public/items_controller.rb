class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @total_items = Item.count
  end

  def show
  end
end
