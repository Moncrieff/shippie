require 'spec_helper'
require 'cancan/matchers'

describe BidsController do

  let(:customer) do
    customer = Factory(:user, :role => 'customer')
    customer.confirm!
    customer
  end

  let(:delivery) do
    delivery = Factory(:delivery)
  end

  let(:bid) do
    bid = Factory(:bid)
  end

  def cannot_act_on_bids!
      response.should redirect_to(deliveries_path)
      flash[:alert].should eql("You are not authorized to access this page.")
  end


  context "customers" do

    it "cannot begin to create new bid" do
      sign_in(:user, customer)
      get :new, { :delivery_id => delivery.id, :id => bid.id }
      cannot_act_on_bids!
    end

    it "cannot create new bid" do
      sign_in(:user, customer)
      post :create, { :delivery_id => delivery.id, :id => bid.id }
      cannot_act_on_bids!
    end
  end

end
