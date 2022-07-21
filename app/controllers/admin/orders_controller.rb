class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path
    else
      render :show
    end
  end


  def order_params
    params.require(:order).permit(:customer_id , :postcode, :address, :name, :payment_method, :total_payment, :shipping_cost, :status )
  end




end
