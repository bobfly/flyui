import { Application } from "@hotwired/stimulus"

const application = Application.start()

import TC from "@rolemodel/turbo-confirm"

TC.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
