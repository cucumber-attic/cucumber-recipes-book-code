When /^I compare (\w+) and (\w+)$/ do |sym1, sym2|
  @winner = StockVsStock.fight sym1, sym2
end

Then /^(\w+) should win$/ do |expected|
  @winner.should == expected
end
