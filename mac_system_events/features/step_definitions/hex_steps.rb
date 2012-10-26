Given /^I have typed "(.*?)"$/ do |text|
  type_in text
end

When /^I view the bytes as an integer$/ do
  click_menu 'Edit', 'Select All'
  @actual = readout_value
end

Then /^I should see "(.*?)"$/ do |expected|
  @actual.should == expected
end
