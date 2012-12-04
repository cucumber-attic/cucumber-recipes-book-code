# START:transform
A_FLOAT = Transform(/(-?\d+(?:\.\d+)?)/) do |number| # <label id="code.win.gui.transform"/>
  number.to_f
end
# END:transform

# START:steps
When /^I convert (#{A_FLOAT}) miles to kilometers$/ do |miles|
  convert_miles_to_km miles
end

Then /^the result should be (#{A_FLOAT}) kilometers$/ do |expected|
  result.should be_within(0.0001).of(expected)
end
# END:steps
