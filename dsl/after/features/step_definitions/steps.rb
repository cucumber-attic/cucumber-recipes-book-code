Before { visit '/reset' }

When /^I visit the homepage$/ do
  visit '/'
end

Given /^I am logged in as "(.*?)"$/ do |username|
  create_user_named username
  log_in_as username
end

Then /^I should see "(.*?)"$/ do |expected_text|
  page.should have_content(expected_text)
end
