// import { Application } from "@hotwired/stimulus"
// const application = Application.start()
// application.debug = false
// window.Stimulus   = application
// export { application }




import { Application } from "@hotwired/stimulus"
import HelloController from "./hello_controller"


window.Stimulus = Application.start()

Stimulus.handleError = (error, message, detail) => {
  console.warn(message, detail)
  ErrorTrackingSystem.captureException(error)
}

Stimulus.register("hello", HelloController)
