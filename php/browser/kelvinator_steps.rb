Given /^a temperature of (\d+) degrees centigrade$/ do |centigrade|
  @centigrade = centigrade.to_i
end

When /^I convert it to Kelvin$/ do
  browser.navigate.to "http://localhost/~#{ENV['USER']}/index.php" #<label id="code.php"/>
  input = browser.find_element :name, 'centigrade'
  input.send_keys @centigrade.to_s
  input.submit

  output = browser.find_element :id, 'kelvin'
  @kelvin = output.text.to_i
end

Then /^the result should be (\d+) degrees Kelvin$/ do |expected|
  @kelvin.should == expected.to_i
end
