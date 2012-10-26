# A standard 1.9 feature that's not in MacRuby yet
#
def require_relative(path)
  require File.join(File.dirname(caller[0]), path.to_str)
end

# Spinach uses Ruby's standard StringIO class but doesn't load it
#
require 'stringio'

# Spinach's error reporting asks for the file and line number;
# MacRuby doesn't provide this
#
class Method
  def source_location
    ['', '']
  end
end
