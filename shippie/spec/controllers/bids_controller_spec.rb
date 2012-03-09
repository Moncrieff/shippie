require 'spec_helper'
require 'cancan/matchers'

describe BidsController do

  let(:customer) do
    customer = Factory(:user, :role => 'customer')
    customer.confirm!
    customer
  end

  let(:transporter) do
    transporter = Factory(:user, :role => 'transporter')
    transporter.confirm!
    transporter
  end

  let(:delivery) do
    delivery = Factory(:delivery)
  end

  let(:bid) do
    bid = Factory(:bid)
  end

  def cannot_act_on_bids!
      response.should redirect_to(delivery_path(delivery))
      flash[:alert].should eql("You are not authorized to access this page.")
  end


  context "customers" do

    before(:each) do 
      sign_in(:user, customer)
    end
    
    it "cannot begin to create new bid" do
      get :new, { :delivery_id => delivery.id, :id => bid.id }
      cannot_act_on_bids!
    end

    it "cannot create new bid" do
      post :create, { :delivery_id => delivery.id, :id => bid.id }
      cannot_act_on_bids!
    end

    it "cannot accept bids for other customer's delivery" do
      put :accept, { :delivery_id => delivery.id, :id => bid.id }
      response.should redirect_to(delivery)
      flash[:alert].should eql("You are not allowed to accept bids.")
    end
  end


  context "transporters" do

    before(:each) do
      sign_in(:user, transporter)
    end

    it "cannot begin to create new bid on expired delivery" do
      delivery.expired = true
      delivery.save
      get :new, { :delivery_id => delivery.id, :id => bid.id }
      cannot_act_on_bids!
    end

    it "cannot create new bid on expired delivery" do
      delivery.expired = true
      delivery.save
      post :create, { :delivery_id => delivery.id, :id => bid.id }
      cannot_act_on_bids!
    end

    it "cannot accept bids" do
      put :accept, { :delivery_id => delivery.id, :id => bid.id }
      response.should redirect_to(delivery)
      flash[:alert].should eql("You are not allowed to accept bids.")
    end

  end

end
