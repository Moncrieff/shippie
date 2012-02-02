When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I create new delivery$/ do
  fill_in('Name', :with => "Some stuff")
  click_button('Create Delivery')
end

Then /^I should see "([^"]*)"$/ do |message|
  page.should have_content(message)
end

Then /^I should be on the delivery page for newly created delivery$/ do 
  current_path.should == delivery_path(Delivery.find_by_name!("Some stuff"))
end

When /^I create new delivery without a name$/ do
  fill_in('Name', :with => "")
  click_button('Create Delivery')
end

Given /^there is a delivery called "([^"]*)"$/ do |name|
  Factory(:delivery, :name => name)
end

Then /^I should be on the delivery page for "([^"]*)"$/ do |page|
  current_path.should == delivery_path(Delivery.find_by_name!(page))
end

When /^I update delivery$/ do
  click_link('Edit Delivery')
  fill_in('Name', :with => "Some stuff beta")
  click_button('Update Delivery')
  page.should have_content('Delivery has been updated.')
end

When /^I update delivery with invalid attributes$/ do
  click_link('Edit Delivery')
  fill_in('Name', :with => "")
  click_button('Update Delivery')
end

When /^I delete a delivery$/ do
  click_link('Delete Delivery')
  page.should have_content('Delivery has been deleted.')
end

Then /^I should not see "([^"]*)"$/ do |delivery|
  page.should_not have_content(delivery)
end
