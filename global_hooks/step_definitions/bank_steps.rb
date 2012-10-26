=begin
# START:with_ivar
Given /^I have \$(\d+) in my account$/ do |balance|
  @browser.navigate.to 'http://example.com/banking'
end
# END:with_ivar
=end

# START:with_method
Given /^I have \$(\d+) in my account$/ do |balance|
  browser.navigate.to 'http://example.com/banking'
end
# END:with_method
