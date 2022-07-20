class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end

  def edit
  end

  def create
    @deliveries = Delivery.all
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to request.referrer
    else
    render 'index'
    end
  end


  def update
  end

  def destroy
  end

  private
    def adress_params
      params.require(:address).permit(:customer_id, :postcode, :name)
    end
end
