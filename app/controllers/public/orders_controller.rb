class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm

    @cart_items = current_customer.cart_items
    #@total = @orders.total_payment + @orders.shipping_cost
    #@total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @total = 0

    @order = Order.new(order_params)
    if params[:order][:address_select] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_select] == "1"
      @delivery = Delivery.find(params[:order][:address_id])
      @order.postcode = @delivery.postcode
      @order.address = @delivery.address
      @order.name = @delivery.name

    elsif params[:order][:address_select] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @orders = Order.all
    @order = Order.new
    

    redirect_to public_orders_complete_path
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total = @order.total_payment - @order.shipping_cost
  end

 private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :total_payment)
  end



end
