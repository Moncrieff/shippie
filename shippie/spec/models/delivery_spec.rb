require 'spec_helper'

describe Delivery do

  let(:delivery) do
    delivery = Factory.build(:delivery)
  end

  it "should be valid with all necessary attributes" do
    delivery.should be_valid
  end
  
  it "should not be valid without name" do
    delivery.name = ""
    delivery.should_not be_valid
  end

  it "should not be valid without origin city" do
    delivery.from_city = ""
    delivery.should_not be_valid
  end
  
  it "should not be valid without origin address" do
    delivery.from_address = ""
    delivery.should_not be_valid
  end
  
  it "should not be valid without destination city" do
    delivery.to_city = ""
    delivery.should_not be_valid
  end
  
  it "should not be valid without destination address" do
    delivery.to_address = ""
    delivery.should_not be_valid
  end
  
  it "should not be valid without category" do
    delivery.category = ""
    delivery.should_not be_valid
  end
end
