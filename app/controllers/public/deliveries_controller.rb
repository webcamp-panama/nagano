class Public::DeliveriesController < ApplicationController

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to request.referrer
    else
    render 'index'
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end




  def update
  end

  def destroy
  end

  private
    def delivery_params
      params.require(:delivery).permit(:customer_id, :postcode, :address, :name)
    end
end
