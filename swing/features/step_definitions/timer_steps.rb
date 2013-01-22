# START:given
Given /^(\d+) seconds have elapsed$/ do |seconds|
  reset
  sleep seconds.to_f
end

When /^I reset the clock$/ do
  reset
end
# END:given

# START:then
Then /^the clock should read "(.*?)"$/ do |expected|
  look_for_text expected
end
# END:then
