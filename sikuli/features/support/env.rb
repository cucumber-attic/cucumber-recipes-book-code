# START:world
require 'java'
require 'sikuli'

class BrowserWorld
  # API methods go here...
  # END:world

  # START:initialize
  def initialize
    @screen = Sikuli::Screen.new                  # from the sikuli gem
    @script = org.sikuli.script.SikuliScript.new  # from the original Java lib
    @script.open_app '/Applications/Google Chrome.app'
    sleep 2
  end

  def close
    @screen.type 'W', KeyModifier::CMD
    @script.close_app '/Applications/Google Chrome.app'
  end
  # END:initialize

  # START:visit
  def visit(url)
    @screen.click "location-bar.png"
    @screen.type "#{url}\n"
  end
  # END:visit

  # START:follow_link_to
  def follow_link_to(name)
    @screen.click "#{name}.png"
  end

  def verify_underlined_link_to(name)
    @screen.find "#{name.downcase}-underlined.png"
  end
  # END:verify_underlined_link_to

  # START:world
end

World { BrowserWorld.new }

After { close }
# END:world
