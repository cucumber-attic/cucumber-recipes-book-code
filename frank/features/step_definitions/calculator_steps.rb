# START:given
Given /^I have cleared the calculator$/ do
  touch "button marked:'C'"
end
# END:given

# START:when
When /^I press "(.+)"$/ do |keys|
  keys.each_char do |k|
    touch "button marked:'#{k}"
  end
end
# END:when

# START:then
Then /^the result should be "(.+)"$/ do |expected|
  check_element_exists "label marked:'#{expected}"
end
# END:then
