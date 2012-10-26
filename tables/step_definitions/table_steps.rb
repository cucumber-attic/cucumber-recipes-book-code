Given /^I am logged in as a buyer$/ do
end

# START:rename
When /^I search for available cars$/ do
  @cars = [{'colour' => 'rust', 'model' => 'Camaro'},
           {'colour' => 'blue', 'model' => 'Gremlin'}]
end
# END:rename

# START:headers
Then /^I should see the following cars:$/ do |table|
# END:headers
=begin
  # START:alt
  table.map_headers! /colou?r/ => 'colour'
  table.map_headers! { |name| name.sub('color', 'colour') }
  # END:alt
=end
  # START:headers
  table.map_headers! 'color' => 'colour'
  table.diff! @cars
end
# END:headers

# START:convert
require 'bigdecimal'

When /^I view warranty options$/ do
  _1000 = BigDecimal.new '1000'
  _500  = BigDecimal.new '500'
  _200  = BigDecimal.new '200'

  @warranties = [{'name' => 'Platinum', 'price' => _1000, 'code' => 'P'},
                 {'name' => 'Gold',     'price' => _500,  'code' => 'G'},
                 {'name' => 'Silver',   'price' => _200,  'code' => 'S'}]
end
# END:convert

# START:column
Then /^I should see the following options:$/ do |table|
  table.map_column!(:price) { |cell| BigDecimal.new(cell.sub('$', '')) }
  table.diff! @warranties
  # END:column

=begin
  # START:strict
  table.diff! @warranties, :surplus_col => true
  # END:strict
=end

  # START:column
end
# END:column
