class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm

    @cart_items = current_customer.cart_items
    #@total = @orders.total_payment + @orders.shipping_cost
    #@total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @total = 0

    @order = Order.new
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
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
       cart_items.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      order_detail = OrderDetail.new
      order_detail.item_id = cart.item_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_detail.price = cart.item.price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_detail.save
    end
    redirect_to public_orders_complete_path
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
    else
    @order = Order.new(order_params)
    render :new

    end
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
