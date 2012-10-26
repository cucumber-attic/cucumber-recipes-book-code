require 'capybara/cucumber'

Capybara.default_driver = :selenium
Capybara.app_host = 'http://squeaker.heroku.com'
