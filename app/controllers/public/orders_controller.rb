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
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
  end



  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end



end
