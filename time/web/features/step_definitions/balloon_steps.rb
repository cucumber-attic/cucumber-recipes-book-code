# START:test
Given /^a balloon$/ do
  visit 'http://localhost:4567/inflate'
end

When /^I inflate it for (\d+) seconds$/ do |seconds|
  # END:test
=begin
  # START:test
  sleep seconds.to_f
  visit 'http://localhost:4567/status'
  # END:test
=end

  # START:timecop
  Timecop.freeze(seconds.to_i) do
    visit 'http://localhost:4567/status'
  end
  # END:timecop
  # START:test
end

Then /^it should pop$/ do
  page.should have_content 'Popped!'
end
# END:test
