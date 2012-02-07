When /^I create a bid$/ do
  fill_in('Price', :with => '100')
  click_button('Bid')
end

When /^I create a bid with invalid attributes$/ do
  fill_in('Price', :with => '')
  click_button('Bid')
end

Given /^that delivery has a bid (\d+)$/ do |price|
  @delivery.bids.create!(:price => price)
end

Then /^I should see a bid with price (\d+)$/ do |price|
  page.should have_content(price)
  page.should_not have_content(321)
end
