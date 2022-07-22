class Public::DeliveriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @deliveries = Delivery.all
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
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
        redirect_to public_deliveries_path
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    if @delivery.destroy
    redirect_to public_deliveries_path
    end
  end

  private
    def delivery_params
      params.require(:delivery).permit(:customer_id, :postcode, :address, :name)
    end
end
