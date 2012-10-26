// START:structure
// START_HIGHLIGHT
import cucumber.runtime.PendingException

this.metaClass.mixin (cucumber.runtime.groovy.EN)
// END_HIGHLIGHT

// END:structure
/*
// START:structure
Given(~'^I see (\\d+) buildings\$') { int arg1 ->
    // ...
}

When(~'^I slingshot a bird\$') { ->
    // ...
}

Then(~'^I should see (\\d+) buildings\$') { int arg1 ->
    // ...
}
// END:structure
*/

// START:given
import furious.fowl.GameController

GameController gameController

Given(~'^I see (\\d+) buildings\$') { int buildings ->
    gameController = new GameController ()
    gameController.params.buildings = buildings
    gameController.index ()
}
// END:given

// START:when
When(~'^I slingshot a bird\$') { ->
    gameController.slingshot ()
}
// END:when

// START:then
Then(~'^I should see (\\d+) buildings\$') { int buildings ->
    // START_HIGHLIGHT
    gameController.params.buildings = null
    gameController.response.reset ()
    // END_HIGHLIGHT

    gameController.index ()

    expected = "You see ${buildings} building(s)."
    assert gameController.response.text.contains(expected)
}
// END:then
