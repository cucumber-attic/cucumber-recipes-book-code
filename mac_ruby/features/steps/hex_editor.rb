# START:require
require 'axelements'
require 'rspec-expectations'
# END:require

class HexEditor < Spinach::FeatureSteps
  # START:given
  Given 'a hex editor' do
    @app = AX::Application.new 'Hex Fiend'
  end
  # END:given

  # START:when
  When 'I type some text' do
    type 'ABCD', @app
  end
  # END:when

  # START:then
  Then 'I should be able to view the bytes as an integer' do
    edit_menu       = @app.menu_bar_item title:'Edit'
    select_all_item = edit_menu.menu_item title:'Select All'
    press select_all_item

    readout = @app.main_window.table.text_field
    readout.value.should == "-12885"
  end
  # END:then
end

# START:setup
`open -a 'Hex Fiend'`
# END:setup

# START:teardown
Spinach.hooks.after_run do
  hex_fiend = Accessibility.application_with_name 'Hex Fiend'
  terminate hex_fiend
  type '\CMD+d'
end
# END:teardown
