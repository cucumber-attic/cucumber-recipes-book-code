# START:when
When /^I bookmark "(.*?)"$/ do |url|
  performAction 'enter_text_into_numbered_field', url, 1
  performAction 'click_on_view_by_id', 'addUrl'
end
# END:when

# START:then
Then /^I should see the following bookmarks:$/ do |expected|
  performAction 'wait_for_text', 'Enter a URL to bookmark', 5

  result = performAction 'get_list_item_text'
  actual = result['bonusInformation']
  actual.each_with_index do | row_data, index |
    row_data = JSON.parse row_data
    actual[index] = row_data
  end

  expected.map_headers! 'url' => 'text1'
  expected.diff! actual
end
# END:then
