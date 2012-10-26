# START:when
When /^I search the forums for "([^"]*)"$/ do |term|
  escaped = CGI::escape term
  visit "http://forums.pragprog.com/search?q=#{escaped}"
end
# END:when

# START:then
Then /^I should see the most recent posts first$/ do
  doc = Nokogiri::HTML response_body
  dates = doc.css('div.date').map { |e| Time.parse e.text }
  dates.should have_at_least(1).item
  dates.should == dates.sort.reverse
end
# END:then
