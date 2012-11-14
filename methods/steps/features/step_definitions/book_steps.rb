Given /^I am on the page for "(.*?)"$/, :visit_book_page
When /^I look for related titles$/,     :find_related_titles
Then /^I should see "(.*?)"$/,          :verify_related_title
