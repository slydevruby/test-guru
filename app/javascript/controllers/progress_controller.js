import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const progressBar = this.element;
    const no = progressBar.dataset.questionNo;
			const total = progressBar.dataset.questionTotal;
    const width = Math.round((100 * no) / total);
			progressBar.style = `width: ${width}` + "%";
    progressBar.ariaValueNow = width;
  }
}
