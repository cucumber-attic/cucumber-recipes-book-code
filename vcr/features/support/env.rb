# START:lib
$LOAD_PATH << 'lib'
require 'stock_vs_stock'
# END:lib

# START:vcr
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end
# END:vcr

# START:tag
VCR.cucumber_tags do |t|
  t.tag '@vcr', :use_scenario_name => true
end
# END:tag
