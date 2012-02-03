When /^I create a bid$/ do
  click_link('New Bid')
  fill_in('Price', :with => '100')
  click_button('Bid')
end

When /^I create a bid with invalid attributes$/ do
  click_link('New Bid')
  fill_in('Price', :with => '')
  click_button('Bid')
end
