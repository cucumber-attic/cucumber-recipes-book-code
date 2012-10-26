require 'selenium-webdriver'

module HasBrowser
  @@browser = Selenium::WebDriver.for :firefox
  at_exit { @@browser.quit }

  def browser
    @@browser
  end
end

World(HasBrowser)
