# START:api
require 'httparty'

class ApiWorld
  def take_square_root(number)
    response = HTTParty.get "http://localhost:4567/api/square_root/#{number}"
    @result = response.body.to_f
  end

  def square_root_result
    @result
  end

  def close
  end
end

After { close }
# END:api

# START:web
require 'selenium-webdriver'

class WebWorld
  def initialize
    @browser = Selenium::WebDriver.for :firefox
  end

  def take_square_root(number)
    @browser.navigate.to "http://localhost:4567"
    @browser.find_element(:name => 'number').send_keys number.to_s
    @browser.find_element(:name => 'submit').click
  end

  def square_root_result
    @browser.find_element(:id => 'result').text.to_f
  end

  def close
    @browser.quit
  end
end
# END:web

# START:env
if ENV['USE_GUI']
  World { WebWorld.new }
else
  World { ApiWorld.new }
end
# END:env
