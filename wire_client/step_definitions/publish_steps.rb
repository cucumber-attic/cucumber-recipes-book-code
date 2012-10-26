# START:compound
When /^I publish an article$/ do
  steps %{
    When I set the title to "First post!"
    When I set the body to "Hello world!"
    When I click the "Done" button
  }
end
# END:compound

# In our hypothetical wire protocol example, the following steps would
# be furnished by the wire server.

When /^I set the title to "First post!"$/ do
end

When /^I set the body to "Hello world!"$/ do
end

When /^I click the "Done" button$/ do
end
