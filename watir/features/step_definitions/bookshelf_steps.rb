# START:given
EmailField    = '//div[@id="content"]//input[@name="email"]'
PasswordField = '//div[@id="content"]//input[@name="password"]'
SubmitButton  = '//div[@id="content"]//button[@type="submit"]'

Given /^I am logged in$/ do
  browser.goto 'http://pragprog.com/login'
  browser.text_field(:xpath => EmailField   ).set ENV['PRAG_EMAIL']
  browser.text_field(:xpath => PasswordField).set ENV['PRAG_PASSWORD']
  browser.button(:xpath => SubmitButton).click
end
# END:given

# START:when
When /^I view my account$/ do
  browser.goto 'http://pragprog.com/my_bookshelf'
end
# END:when

# START:then
Then /^I should see a sorted list of purchased books$/ do
  doc = Nokogiri::HTML browser.html
  titles = doc.css('table#bookshelf tr td.description p.title').map &:text
  titles.should_not be_empty
  titles.should == titles.sort_by(&:upcase)
end
# END:then
