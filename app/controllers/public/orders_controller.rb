class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @delivery = Delivery.find(params[:order][:address_id])
    @order.postal_code = @delivery.postcode
    @order.address = @delivery.address
    @order.name = @delivery.name
  end

  def complete
  end

  def create
    @orders = Order.all
    @order = Order.new(order_params)

      redirect_to public_orders_confirm_path


  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
  end

 private
  def order_params
    params.require(:order).permit(:payment_method,  :postcode, :address, :name, :address_select, :address_id)
  end



end
