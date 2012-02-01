class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end

  def new
   @delivery = Delivery.new 
  end

  def create
    @delivery = Delivery.new(params[:delivery])
    if @delivery.save
       flash[:notice] = "Delivery has been created."
       redirect_to @delivery
    else
      flash[:alert] = "Delivery has not been created."
      render :action => "new"
    end
  end

  def show
    @delivery = Delivery.find(params[:id])
  end
end
