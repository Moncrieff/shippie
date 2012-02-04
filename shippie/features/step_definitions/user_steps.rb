When /^I'm signing up$/ do
  click_link('Sign up')
  fill_in('Email', :with => 'user@shippie.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  click_button('Sign up')
end
