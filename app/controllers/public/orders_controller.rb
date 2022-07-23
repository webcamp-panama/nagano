class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.find(params[:id])
  end

  def complete
  end

  def create
    @orders = Order.all
    redirect_to public_orders_confirm_path
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total = @order.total_payment - @order.shipping_cost
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end



end
