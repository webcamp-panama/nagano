class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = order_details.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_detail_path
    else
      render :show
    end
  end

end
