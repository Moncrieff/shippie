def unconfirmed_user
  @unconfirmed_user = Factory(:user)
end


def sign_up user
  visit '/users/sign_up'
  fill_in('Email', :with => "unique@unique.com")
  fill_in('Password', :with => user.password)
  fill_in('Password confirmation', :with => user.password)
  click_button('Sign up')
end

def sign_in user
  visit 'users/sign_in'
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => user.password)
  click_button('Sign in')
end

When /^I'm signing up$/ do
  sign_up unconfirmed_user
end

Given /^there is an unconfirmed user$/ do
  unconfirmed_user
end

Given /^there is a confirmed user$/ do
  unconfirmed_user.confirm!
end

Then /^I should be registered and signed in$/ do
  page.should have_content("Signed in as #{unconfirmed_user.email}")
end

Given /^user signs in$/ do
  sign_in unconfirmed_user.confirm!
end

When /^I open the email with subject "([^"]*?)"$/ do |subject|
  open_email(@unconfirmed_user.email, :with_subject => subject)
end

Given /^I am logged in$/ do
end
