class Public::DeliveriesController < ApplicationController

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @deliveries = Delivery.all
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to request.referer
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
        redirect_to request.referer
    end
  end

  def destroy
  end

  private
    def delivery_params
      params.require(:delivery).permit(:customer_id, :postcode, :address, :name)
    end
end
