Given /^(\d+) "(.*?)"s$/ do |count, digit|
  @first = BigInteger.new(digit * count.to_i)
end

When /^I add "(.*?)"$/ do |digits|
  @second   = BigInteger.new(digits)
  @expected = @first.add @second
end

Then /^I should see "(.*?)" with (\d+) "(.*?)"s$/ do |lead, count, digit|
  @actual = BigInteger.new(lead + digit * count.to_i)
  @actual.should == @expected
end
