# START:appending
When /^I append the ([a-z]+) "([^"]*)"$/ do
  | priority, message |

  @log.append priority, message
end

Then /^the log should read:$/ do |expected|
  @log.contents.should == expected
end
# END:appending

# START:parsing
When /^I parse the log$/ do
  @entries = @log.parse
end

Then /^the entries should be:$/ do |table|
  table.diff! @entries
end
# END:parsing

# START:common
Given /^a log containing:$/ do |contents|
  @log = Log.new contents
end
# END:common
