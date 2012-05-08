def good_delivery
  @delivery = Factory(:delivery)
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I create new delivery$/ do
  fill_in('Name', :with => "Some stuff")
  select('Furniture', :from => 'Category')
  fill_in('Weight', :with => "24")
  fill_in('Length', :with => "120")
  fill_in('Height', :with => "80")
  fill_in('Wideness', :with => "20")
  fill_in('From City', :with => "St. Petersburg")
  fill_in('From Address', :with => "Malaya Morskaya, 23")
  fill_in('To City', :with => "Akhtubinsk")
  fill_in('To Address', :with => "Lenina, 12")
  select_date('Deliver by:', :with => '22/05/2012')
  fill_in('Description', :with => "One table with the books in it, very fragile")
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
  @delivery = Factory(:delivery, :name => name)
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

Then /^I create new delivery without mandatory fields filled$/ do
  fill_in('Name', :with => "Name")
  fill_in('From', :with => "")
  fill_in('To', :with => "")
  click_button('Create Delivery')
end

Then /^I should see list of deliveries with fields$/ do
  page.should have_content('From')
  page.should have_content('To')
  page.should have_content('Date due')
  page.should have_content('Category')
  page.should have_content(@delivery.name)
  page.should have_content(@delivery.from_city)
  page.should have_content(@delivery.from_address)
  page.should have_content(@delivery.to_city)
  page.should have_content(@delivery.to_address)
  page.should have_content(@delivery.date)
  page.should have_content(@delivery.category)
end

Given /^there is a delivery called "([^"]*)" with expiration date "([^"]*)"$/ do |name, date|
  @expired_delivery = Factory(:delivery, :name => name, :date => date, :expired => true)
  #@delivery.expired = true
  #@delivery.save
end

Given /^there is an accepted delivery "([^"]*)"$/ do |name|
  @delivery = Factory(:delivery, :name => name, :accepted => true)
end

Then /^I should see a "([^"]*)" delivery info$/ do |name|
  page.should have_content(name)
  page.should have_content("From city")
  page.should have_content("From address")
  page.should have_content("To city")
  page.should have_content("To address")
  page.should have_content("Date due")
  page.should have_content("Bids")
  page.should have_content("Category")
end

#Given /^"([^"]*)" can edit "([^"]*)" delivery$/ do |user, delivery|
#  @user = User.find_by_email(user)
#  @user.role = "customer"
#  @delivery = Delivery.find_by_name(delivery)
#  @ability = Ability.new(@user)
#  @ability.can :update, @delivery
#  @ability.can :read, :all
#end

Given /^there is a delivery "([^"]*)" created by "([^"]*)"$/ do |delivery, user|
  @user = User.find_by_email(user)
  @delivery = Factory(:delivery, :name => delivery, :user_id => @user.id)
end
