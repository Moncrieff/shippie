When /^I create a bid$/ do
  fill_in('Price', :with => '100')
  click_button('Bid')
end

When /^I create a bid with invalid attributes$/ do
  fill_in('Price', :with => '')
  click_button('Bid')
end

Given /^that delivery has a bid (\d+)$/ do |price|
  @delivery.bids.create!(:price => price, :user_id => @user.id)
end

Then /^I should see a bid with price (\d+)$/ do |price|
  page.should have_content(price)
  page.should_not have_content(321)
end

Then /^I should see it was created by respective user$/ do
  page.should have_content("by #{@user.email}")
end

Given /^there is a bid for "([^"]*)" created by "([^"]*)"$/ do |delivery, user|
  @user = User.find_by_email(user)
  @bid = Factory(:bid, :delivery_id => @delivery.id, :user_id => @user.id)
end

When /^I accept bid (\d+)$/ do |price|
  @bid = Bid.find_by_price(price)
end
