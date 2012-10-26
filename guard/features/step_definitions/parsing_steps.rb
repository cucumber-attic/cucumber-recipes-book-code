When /^I parse the log$/ do
  @entries = @log.parse
end

Then /^the entries should be:$/ do |table|
  table.diff! @entries
end
