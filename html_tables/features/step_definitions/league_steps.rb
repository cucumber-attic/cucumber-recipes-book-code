# START:when
When /^I view the league page$/ do
  visit '/lawn_darts.html'
end
# END:when

# START:then
Then /^I should see the following teams:$/ do |expected|
  rows   = find('table:nth-of-type(2)').all('tr')             #<label id="code.league.rows"/>
  actual = rows.map { |r| r.all('th,td').map { |c| c.text } } #<label id="code.league.cols"/>
  expected.diff! actual                                       #<label id="code.league.diff"/>
end
# END:then
