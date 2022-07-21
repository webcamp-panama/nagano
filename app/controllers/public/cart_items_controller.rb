class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
    @cart_items = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_items.quantity += params[:cart_item][:quantity].to_i
      cart_items.save
      redirect_to public_cart_items_path
    elsif @cart_items.save
      @cart_items = current_customer.cart_items.all
      render 'index'
    else
      render 'index'
    end
  end

  def destroy
    cart_items = CartItem.find(params[:id])
    cart_items.destroy
    @cart_items = CartItem.all
     render 'index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
     render 'index'
  end

  def create

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :price, :quantity)
  end
end
