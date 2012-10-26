# START:assert
{strictEqual} = require 'assert'
# END:assert

# START:given
stepDefinitions = () ->
  # END:given

  # START:world
  @World = require('../support/World').World
  # END:world

  # START:given
  @Given /^the sign is unlit/, (callback) ->
    @controlPanel.deactivateSign()
    callback()
  # END:given

  # START:when
  @When /^I press the button$/, (callback) ->
    @controlPanel.pressButton()
    callback()

  @Then /^the sign should light up with/, (expected, callback) ->
    strictEqual @controlPanel.signMessage(), expected
    callback()
  # END:when

# START:given

module.exports = stepDefinitions
# END:given