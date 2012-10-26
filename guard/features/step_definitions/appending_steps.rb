When /^I append the ([a-z]+) "([^"]*)"$/ do
  | priority, message |

  @log.append priority, message
end

Then /^the log should read:$/ do |expected|
  @log.contents.should == expected
end
