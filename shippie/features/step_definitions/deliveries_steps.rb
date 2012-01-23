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
