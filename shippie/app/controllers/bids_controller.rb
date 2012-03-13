class BidsController < ApplicationController
  before_filter :find_delivery
  before_filter :find_bid, :only => [:accept]
  before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to delivery_path(@delivery), :alert => exception.message
  end

  def new
    authorize! :create_bid_for_delivery, @delivery
    authorize! :bid_on_deliveries, @delivery
      @bid = @delivery.bids.build
  end

  def create
    authorize! :create_bid_for_delivery, @delivery
    authorize! :bid_on_deliveries, @delivery
    @bid = @delivery.bids.build(params[:bid].try(:merge!, :user => current_user))
    if @bid.save
      flash[:notice] = "Bid has been created."
      redirect_to @delivery
    else
      flash[:alert] = "Bid has not been created."
      redirect_to @delivery
    end
  end

  def accept
    authorize! :accept_bids, @delivery, :message => "You are not allowed to accept bids."
    @bid.update_attributes(:accepted => true)
    @delivery.update_attributes(:accepted => true)
    flash[:notice] = "You've accepted the bid."
    redirect_to @delivery
  end

  private

  def find_delivery
    @delivery = Delivery.find(params[:delivery_id])
  end

  def find_bid
    @bid = @delivery.bids.find(params[:id])
  end
end
