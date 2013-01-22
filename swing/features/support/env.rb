# START:import
require 'java'

Dir['jars/*.jar'].each { |jar| require jar }

java_import org.freeshell.zs.presentationclock.PresentationClock
java_import org.fest.swing.edt.GuiActionRunner
java_import org.fest.swing.edt.GuiQuery
java_import org.fest.swing.fixture.FrameFixture
java_import org.fest.swing.core.matcher.JButtonMatcher
java_import org.fest.swing.core.matcher.JLabelMatcher
# END:import

# START:before
class AppStarter < GuiQuery
  # Launch the app in the Event Dispatch Thread (EDT),
  # which is the thread reserved for user interfaces.
  # FEST will call this method for us before the test.
  #
  def executeInEDT
    PresentationClock.new []
  end
end

module HasFrame
  runner  = GuiActionRunner.execute(AppStarter.new)
  @@window = FrameFixture.new(runner)

  # ... more methods go here ...
  # END:before

  # START:after
  at_exit do
    title = 'Confirm Exit - PresentationClock'

    @@window.close
    @@window.option_pane.require_title(title).yes_button.click
  end
  # END:after

  # START:reset
  def reset
    button = @@window.button(JButtonMatcher.with_text 'Reset')
    button.click
  end
  # END:reset

  # START:look_for_text
  def look_for_text(expected)
    @@window.label JLabelMatcher.with_text(expected)
  end
  # END:look_for_text

  # START:before
end

World(HasFrame)
# END:before

# START:after
# END:after
