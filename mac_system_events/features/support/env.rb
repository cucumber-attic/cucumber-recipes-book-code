# START:structure
require 'appscript'

include Appscript

module DrivesApp
  # helper methods go here...

  # END:structure

  # START:click_menu
  def click_menu(bar, item)
    app('System Events').
      processes['Hex Fiend'].
      menu_bars[1].
      menu_bar_items[bar].
      menus[bar].
      menu_items[item].
      click
  end
  # END:click_menu

  # START:type_in
  def type_in(text)
    text.chars.each do |c|
      app('System Events').
        keystroke c
    end
  end
  # END:type_in

  # START:readout_value
  def readout_value
    app('System Events').
      processes['Hex Fiend'].
      windows[0].
      splitter_groups[0].
      scroll_areas[0].
      tables[0].
      rows[0].
      text_fields[0].value.get
  end
  # END:readout_value

  # START:structure
end

World(DrivesApp)
# END:structure

# START:launch
`open -a 'Hex Fiend'`
at_exit { app('Hex Fiend').quit :saving => :no }
# END:launch
