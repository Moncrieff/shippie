class DeliveriesController < ApplicationController
  def index
    #
  end

  def new
   @delivery = Delivery.new 
  end

  def create
    @delivery = Delivery.new(params[:delivery])
    @delivery.save
    redirect_to @delivery,
      :notice => "Delivery has been created."
  end

  def show
    @delivery = Delivery.find(params[:id])
  end
end
