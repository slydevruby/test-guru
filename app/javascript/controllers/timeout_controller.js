import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String, timeout: Number };

  disconnect() {
    if (this.timer_interval) {
      clearInterval(this.timer_interval);
    }
  }
  connect() {
    console.log(this.timeoutValue);
    console.log(this.urlValue);

    if (this.timeoutValue && this.timeoutValue > 0) {
      setTimeout(() => {
        clearInterval(this.timer_interval);
        window.location.href = this.urlValue;
        //this.httpGet(this.urlValue)
      }, this.timeoutValue * 1000);

      this.timer_interval = setInterval(() => {
        --this.timeoutValue;
        this.element.innerText = `${this.timeoutValue}`;
      }, 1000);
    }
  }
}
