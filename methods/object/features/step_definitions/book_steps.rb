Given /^I am on the page for "(.*?)"$/, :visit_book_page, :on => lambda { page }
When /^I look for related titles$/, :find_related_titles, :on => lambda { page }
Then /^I should see "(.*?)"$/,     :verify_related_title, :on => lambda { page }
