class Public::HomesController < ApplicationController
  def top
    @item = Item.page(params[:page]).per(3)
  end

  def about
  end

  def item_params
    params.require(:item).permit(:name, :price, :image)
  end
end
