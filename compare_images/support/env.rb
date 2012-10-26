require 'fileutils'
require 'chunky_png'

include ChunkyPNG

Before do
  FileUtils.rm_f 'generated.png'
end
