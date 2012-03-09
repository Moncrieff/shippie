class BidsController < ApplicationController
  before_filter :find_delivery
  before_filter :find_bid, :only => [:show,
                                     :edit,
                                     :update,
                                     :destroy]
  before_filter :authenticate_user!
  #load_and_authorize_resource :only => [:create]
  def new
    authorize! :create_bid_for_delivery, @delivery
      @bid = @delivery.bids.build
  end

  def create
    authorize! :create_bid_for_delivery, @delivery
    @bid = @delivery.bids.build(params[:bid].try(:merge!, :user => current_user))
    if @bid.save
      flash[:notice] = "Bid has been created."
      redirect_to @delivery
    else
      flash[:alert] = "Bid has not been created."
      redirect_to @delivery
    end
  end


  private

  def find_delivery
    @delivery = Delivery.find(params[:delivery_id])
  end

  def find_bid
    @bid = @delivery.bids.find(params[:id])
  end
end
