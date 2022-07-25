class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "making"
        @order_detail.order.update(status: "making" )
      elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "making_complete" ).count
        @order_detail.order.update(status: "prepare_shipping")
      end
      redirect_to admin_order_path(@order_detail.order_id)
    else
      render 'admin/order/show'
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end


end
