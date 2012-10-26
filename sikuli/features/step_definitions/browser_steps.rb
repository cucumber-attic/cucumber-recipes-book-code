Given /^I am on "(.*?)"$/ do |url|
  visit url
end

When /^I click the "(.*?)" link$/ do |name|
  follow_link_to name
end

Then /^I should see an underlined "(.*?)" link$/ do |name|
  verify_underlined_link_to name
end
