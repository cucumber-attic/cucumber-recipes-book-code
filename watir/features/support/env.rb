require 'watir-webdriver'
require 'nokogiri'

module HasBrowser
  @@browser = Watir::Browser.new :chrome
  at_exit { @@browser.close }

  def browser
    @@browser
  end
end

World HasBrowser
