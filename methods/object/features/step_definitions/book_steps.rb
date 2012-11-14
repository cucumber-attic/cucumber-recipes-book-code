Given /^I am on the page for "(.*?)"$/, :visit_book_page,      lambda { page }
When /^I look for related titles$/,     :find_related_titles,  lambda { page }
Then /^I should see "(.*?)"$/,          :verify_related_title, lambda { page }
