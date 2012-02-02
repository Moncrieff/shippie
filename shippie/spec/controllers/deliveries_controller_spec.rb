require 'spec_helper'

describe DeliveriesController do
  it "displays an error for missing delivery" do
    get :show, :id => "not-here"
    response.should redirect_to(deliveries_path)
    message = "The delivery you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end
