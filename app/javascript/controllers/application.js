import { Application } from "@hotwired/stimulus";

const application = Application.start();
application.debug = false;
window.Stimulus = application;
export { application };

import ProgressController from "./progress_controller";
import TimeoutController from "./timeout_controller";

Stimulus.handleError = (error, message, detail) => {
  console.warn(message, detail);
  ErrorTrackingSystem.captureException(error);
};

Stimulus.register("progress", ProgressController);
Stimulus.register("timeout", TimeoutController);
