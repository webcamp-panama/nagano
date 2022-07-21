class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_items.update(quantity: params[:quantity].to_i)
    redirect_to current_cart_item
  end

  def destroy
    @cart_items.destroy
    redirect_to current_cart_item
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to public_cart_item_path
  end

  def create
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
