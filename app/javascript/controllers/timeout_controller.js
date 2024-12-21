import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String, timeout: Number, label: String };

  disconnect() {
    if (this.timer_interval) {
      clearInterval(this.timer_interval);
    }
  }
  connect() {
    if (this.timeoutValue && this.timeoutValue > 0) {
      const form = document.querySelector(".pass_form");
      console.log(form);
      setTimeout(() => {
        clearInterval(this.timer_interval);
        form.submit();
      }, this.timeoutValue * 1000);

      this.timer_interval = setInterval(() => {
        --this.timeoutValue;
        this.element.innerText = `${this.labelValue} ${this.timeoutValue}`;
      }, 1000);
    }
  }
}
