import { Application } from "@hotwired/stimulus"

const application = Application.start()
application.debug = false
window.Stimulus   = application
export { application }


import HelloController from "./hello_controller"
import ProgressController from "./progress_controller"
import RuleController from "./rule_controller"

Stimulus.handleError = (error, message, detail) => {
    console.warn(message, detail)
    ErrorTrackingSystem.captureException(error)
}

Stimulus.register("hello", HelloController)
Stimulus.register("progress", ProgressController)
Stimulus.register("rule", RuleController)
