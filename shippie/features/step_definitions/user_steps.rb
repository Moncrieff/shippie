When /^I'm signing up$/ do
  click_link('Sign up')
  fill_in('Email', :with => 'user@shippie.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  click_button('Sign up')
end

Given /^there is an unconfirmed user$/ do
  @user = Factory(:user)
end

Given /^there is a confirmed user$/ do
  @user = Factory(:user, :confirmed_at => '01/01/2012')
end

Then /^I should be registered and signed in$/ do
  page.should have_content('Your account was successfully confirmed')
  page.should have_content('Signed in as user@shippie.com')
end

Given /^user signs in$/ do
  click_link('Sign in')
  fill_in('Email', :with => 'user@shippie.com')
  fill_in('Password', :with => 'password')
  click_button('Sign in')
end
