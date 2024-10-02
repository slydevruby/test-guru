import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap";

export default class extends Controller {
    showToast() {
        bootstrap.Toast.Default.delay = 2000;
        const toastLiveExample = document.getElementById('liveToast');
        if (toastLiveExample) {
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
            toastBootstrap.show();
        }
    }

    greet(event) {
        const tabs = document.querySelectorAll('.lnk');
        const clicked = event.target.closest('.lnk');
        if (!clicked) return;
        tabs.forEach(t => t.classList.remove('lnk--active'));
        event.target.classList.add('lnk--active');
        // console.log(clicked.dataset.url);
    }

    connect() {
        console.log('me click');
        this.showToast();
    }
}
