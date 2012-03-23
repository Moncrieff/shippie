When /^I write a comment "([^"]*)"$/ do |comment|
  fill_in("Your comment", :with => comment)
  click_button('Create Comment')
end
