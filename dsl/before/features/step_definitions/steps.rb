Before { visit '/reset' }

When /^I visit the homepage$/ do
  visit '/'
end

Given /^I am logged in as "(.*?)"$/ do |username|
  # create account
  visit '/'
  click_link 'create an account'
  fill_in 'Username', with: username
  click_button 'Create My Account'
  click_button 'Log Out'
  # log in
  click_link 'log in'
  fill_in 'Username', with: username
  click_button 'Log in'
end

Then /^I should see "(.*?)"$/ do |expected_text|
  page.should have_content(expected_text)
end
