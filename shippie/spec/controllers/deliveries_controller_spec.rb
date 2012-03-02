require 'spec_helper'
require 'cancan/matchers'

describe DeliveriesController do
  let(:transporter) do
    transporter = Factory(:user, :role => 'transporter')
    transporter.confirm!
    transporter
  end

  let(:customer) do
    customer = Factory(:user, :role => 'customer')
    customer.confirm!
    customer
  end

  let(:delivery) do
    delivery = Factory(:delivery)
  end

  def cannot_act_on_deliveries!
      response.should redirect_to(deliveries_path)
      flash[:alert].should eql("You are not authorized to access this page.")
  end

  context "transporters" do
    it "cannot access the edit action" do
      sign_in(:user, transporter)
      get :edit, :id => delivery.id
      cannot_act_on_deliveries!
    end
  end

  context "customers" do
    it "cannot access the edit action for other customer's delivery" do
      sign_in(:user, customer)
      get :edit, :id => delivery.id
      cannot_act_on_deliveries!
    end
  end

  it "displays an error for missing delivery" do
    get :show, :id => "not-here"
    response.should redirect_to(deliveries_path)
    message = "The delivery you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end
