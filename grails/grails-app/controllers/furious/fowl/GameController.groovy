// START:index
package furious.fowl

class GameController {
    def index() {
        if (params.buildings) {
            session.buildings = params.buildings as int
        }

        if (session.buildings <= 0) {
            session.buildings = 3
        }

        render "You see ${session.buildings} building(s)."
    }
    // END:index

    // START:slingshot
    def slingshot() {
        session.buildings--
        def result = session.buildings > 0 ? 'index' : 'victory'
        redirect(action: result)
    }

    def victory() {
        render "You win!"
    }
    // END:slingshot

    // START:index
}
// END:index
