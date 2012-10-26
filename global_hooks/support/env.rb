=begin
# START:global
require 'selenium-webdriver'

$browser = Selenium::WebDriver.for :firefox
at_exit { $browser.quit }
# END:global
=end

# START:module
require 'selenium-webdriver'

module HasBrowser
  @@browser = Selenium::WebDriver.for :firefox
  at_exit { @@browser.quit }
  # END:module

  # START:accessor
  def browser
    @@browser
  end
  # END:accessor

  # START:module
end
# END:module

# START:world
World(HasBrowser)
# END:world
# ... and I feel fine ...
