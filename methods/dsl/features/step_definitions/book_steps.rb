Given /^I am on the page for "(.*?)"$/ do |title|
  visit_book_page title
end

When /^I look for related titles$/ do
  find_related_titles
end

Then /^I should see "(.*?)"$/ do |title|
  verify_related_title title
end
