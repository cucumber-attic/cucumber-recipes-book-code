require 'capybara/cucumber'
require 'timecop'
require './balloon'

Capybara.app = Sinatra::Application
