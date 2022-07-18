class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
  end

  def create
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
