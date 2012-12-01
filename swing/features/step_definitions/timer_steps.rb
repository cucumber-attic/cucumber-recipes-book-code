# START:given
Given /^(\d+) seconds have elapsed$/ do |seconds|
  sleep seconds.to_f
end
# END:given

# START:when
When /^I reset the clock$/ do
  button = @window.button(JButtonMatcher.with_text 'Reset')
  button.click
end
# END:when

# START:then
Then /^the clock should read "(.*?)"$/ do |expected|
  @window.label JLabelMatcher.with_text(expected)
end
# END:then
