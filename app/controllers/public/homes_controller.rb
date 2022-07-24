class Public::HomesController < ApplicationController
  #before_action :authenticate_admin!

  def top
    @items = Item.page(params[:page]).per(3)
     #redirect_to admin_item_path(item_params)
  end

  def about
  end

  def item_params
    params.require(:item).permit(:name, :price, :image)
  end
end
