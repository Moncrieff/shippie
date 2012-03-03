def unconfirmed_user
  @user = Factory(:user, :email => "mister@shippie.com")
end

def sign_in user
  visit '/users/sign_in'
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => user.password)
  click_button('Sign in')
end

Given /^there are the following users:$/ do |table|
  unconfirmed_user
  table.hashes.each do |attributes|
    @user.update_attributes(attributes)
    @user.confirm!
  end
end

When /^I'm signing up as a "([^"]*)"$/ do |role|
  visit '/users/sign_up'
  fill_in('Email', :with => "new_email@shippie.com")
  fill_in('Password', :with => "password")
  fill_in('Password confirmation', :with => "password")
  select(:user_role, :with => role)
  click_button('Sign up')
end

Given /^there is an unconfirmed user$/ do
  unconfirmed_user
end

Given /^there is a confirmed user$/ do
  unconfirmed_user.confirm!
end

Then /^I should be registered and signed in$/ do
  page.should have_content("Signed in as #{@user.email}")
end

Given /^user signs in$/ do
  @user.confirm!
  sign_in @user
end

Given /^I am signed in as them$/ do
  sign_in @user
  #steps(%Q{
  #  Given I am on the homepage
  #  When I follow 'Sign in'
  #  And I fill in "Email" with "#{@user.email}"
  #  And I fill in "Password" with "password"
  #  And I press "Sign in"
  #  Then I should see "Signed in successfully."
  #})
end

When /^I open the email with subject "([^"]*?)"$/ do |subject|
  open_email(@user.email, :with_subject => subject)
end

When /^I sign out$/ do
  click_link('Sign out')
end

When /^I fill in my credentials$/ do
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => @user.password)
  click_button('Sign in')
end

Then /^I should see a signed out message$/ do
  page.should have_content('Signed out successfully')
end

When /^I return to the site$/ do
  visit '/'
end

Then /^I should be signed out$/ do
  page.should have_content('Sign in')
end
