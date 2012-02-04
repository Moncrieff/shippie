When /^I'm signing up$/ do
  click_link('Sign up')
  fill_in('Email', :with => 'user@shippie.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  click_button('Sign up')
end

Given /^there is a user$/ do
  @user = Factory(:user)
end

Then /^I should be registered and signed in$/ do
  page.should have_content('Your account was successfully confirmed')
  page.should have_content('Signed in as user@shippie.com')
end
