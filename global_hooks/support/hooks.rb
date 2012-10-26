# This is how we might have done it with individual scenario hooks:
=begin
# START:scenario_hooks
require 'selenium-webdriver'

Before do
  @browser = Selenium::WebDriver.for :firefox
end

After do
  @browser.quit
end
# END:scenario_hooks
=end
