Given /^an order for (\d+) tons of material$/ do |tons|
end

=begin
# START:serial
When /^I pack (\d+) shipping containers$/ do |count|
  last = count.to_i

  (1..last).each do |i|
    Shipping.pack_container i
  end
end
# END:serial
=end

# START:parallel
When /^I pack (\d+) shipping containers$/ do |count|
  last = count.to_i

  # START_HIGHLIGHT
  Parallel.each(1..last) do |i|
    # END_HIGHLIGHT
    Shipping.pack_container i
  end
end
# END:parallel

Then /^the order should be complete$/ do
end
