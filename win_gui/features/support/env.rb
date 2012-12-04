# START:structure
require 'win32ole'

class UnitWorld

  # ... definitions will go here ...

  # END:structure

  # START:initialize
  TITLE   = 'Unit Converter'

  def initialize
    @auto_it = WIN32OLE.new 'AutoitX3.Control'
    @auto_it.Run 'C:\Converter\Unit Converter.exe'
    @auto_it.WinWaitActive TITLE
  end

  def close
    @auto_it.WinClose TITLE
  end
  # END:initialize

  # START:convert
  INPUT   = '[NAME:txtbxA]'
  CONVERT = '[NAME:m2k]'
  RESULT  = '[NAME:txtbxAnsA]'

  def convert_miles_to_km(miles)
    @auto_it.ControlSetText TITLE, '', INPUT, miles.to_s
    @auto_it.ControlClick   TITLE, '', CONVERT
  end

  def result
    @auto_it.ControlGetText(TITLE, '', RESULT).to_f
  end
  # END:convert

  # START:structure
end

World { UnitWorld.new }

After do
  close
end
# END:structure
