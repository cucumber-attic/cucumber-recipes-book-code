Given /^I am writing a book$/ do
end

When /^I activate the cone of silence$/ do
end

# START:error
Then /^I should not hear my children for the next hour$/ do
  raise 'a ruckus'
end
# END:error
