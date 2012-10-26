# START:given
Given /^a new game$/ do
  @port = SerialPort.new ENV['SERIAL_PORT']
  @port.baud = 9600
end
# END:given

# START:when
When /^the first buzz comes from (\d+)$/ do |first|
  character = case first
              when 'player 1' then '1'
              when 'player 2' then '2'
              when 'both players' then 'b'
              else raise 'unknown player'
              end

  @port.write character
end
# END:when

# START:then
Then /^LED (\d+) should be lit$/ do |led|
  expected = case led
             when 'LED 1' then '1'
             when 'LED 2' then '2'
             when 'both LEDs' then 'b'
             else raise 'unknown LED'
             end

  @port.write '?'
  @port.read.should == expected
end
# END:then
