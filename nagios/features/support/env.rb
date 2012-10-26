require 'time'
require 'cgi'
require 'webrat'
require 'nokogiri'

Webrat.configure do |config|
  config.mode = :mechanize
end

World Webrat::Methods
