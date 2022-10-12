import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["form"];

  hide() {
    if (typeof event !== 'undefined') {
      event.preventDefault()
    }
    this.formTarget.classList.add("hidden");
  }
}