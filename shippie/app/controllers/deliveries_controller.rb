class DeliveriesController < ApplicationController

  before_filter :find_delivery, :only => [:show,
                                          :edit,
                                          :update,
                                          :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :only => [:edit]

  def index
    @deliveries = Delivery.includes(:bids).all
  end

  def new
   @delivery = Delivery.new 
  end

  def create
    @delivery = Delivery.new(params[:delivery].merge!(:user_id => current_user.id))
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
#    if can? :update, @delivery
#      authorized! 
#    else
#      flash[:alert] = "You can not edit this delivery."
#      redirect_to deliveries_path
#    end
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

  
  private

  def find_delivery
    @delivery = Delivery.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The delivery you were looking for could not be found."
    redirect_to deliveries_path
  end
end
