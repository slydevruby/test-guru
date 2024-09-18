import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    disconnect() {

    }

    greet(event) {
        const tabs = document.querySelectorAll('.lnk');
        const clicked = event.target.closest('.lnk');
        if (!clicked) return;
        tabs.forEach(t => t.classList.remove('lnk--active'));
       event.target.classList.add('lnk--active');
    }

    connect() {
        console.log('me click')
    }
}
