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

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update_attributes(params[:delivery])
       flash[:notice] = "Delivery has been updated."
       redirect_to @delivery
    else
      flash[:alert] = "Delivery has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    flash[:notice] = "Delivery has been deleted."
    redirect_to deliveries_path
  end
end
