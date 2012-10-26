Given /^a balloon$/ do
  visit 'http://localhost:4567/inflate'
end

# START:when
When /^I inflate it for (\d+) seconds$/ do |seconds|
  page.execute_script <<HERE
popLater = function(ms) {
  pop();
};
HERE
# END:when

  click_on 'Go'
end

Then /^it should pop$/ do
  page.should have_content 'Popped!'
end
