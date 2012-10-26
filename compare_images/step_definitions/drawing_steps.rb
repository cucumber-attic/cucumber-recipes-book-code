# START:given_when
Given /^a white background$/ do
  @canvas = Canvas.new 300, 200, Color::WHITE
end

When /^I draw a green circle$/ do
  green = Color.rgb 0, 255, 0
  @canvas.circle 150, 100, 50, green, green
end
# END:given_when

# START:then
Then /^the result should resemble "([^"]*)"$/ do |filename|
  @canvas.save 'generated.png'
  `perceptualdiff -downsample 2 #{filename} generated.png`
  $?.should be_success
end
# END:then
