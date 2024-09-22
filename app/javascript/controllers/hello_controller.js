import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


    static values = { url: String, timeout: Number }

    disconnect() {
        if (this.timer_interval) { clearInterval(this.timer_interval); }
    }

    connect() {
        if (this.timeoutValue && this.timeoutValue > 0) {

            let timer = setTimeout(() => {
                clearInterval(this.timer_interval)
                window.location.href = this.urlValue;
            }, this.timeoutValue * 1000);

            this.timer_interval = setInterval(() => {
                --this.timeoutValue;
                this.element.innerText = `${this.timeoutValue}`;
            }, 1000);
        }

    }

}