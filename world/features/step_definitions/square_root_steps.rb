# START:transform
A_FLOAT = Transform(/(-?\d+(?:\.\d+)?)/) do |number|
  number.to_f
end
# END:transform

# START:when
When /^I take the square root of (#{A_FLOAT})$/ do |number|
  take_square_root(number)
end
# END:when

# START:then
Then /^I should get (#{A_FLOAT})$/ do |expected|
  tolerance = expected.abs * 0.001
  square_root_result.should be_within(tolerance).of(expected)
end
# END:then
