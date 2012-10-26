Given /^(\w+) nonstop flight exists$/ do |qualifier|
end

# START:delay
When /^I plan my trip$/ do
  sleep 10
end
# END:delay

Then /^I should see the nonstop options first$/ do
end

Then /^I should be shown connecting flights$/ do
end
