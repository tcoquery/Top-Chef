import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ['container'];

  connect() {
    this.toggleClass = 'hidden';
    this.backgroundId = 'modal-background';
    this.backgroundHtml = this._backgroundHTML();
  }

  disconnect() {
    this.close();
  }

  open() {
    document.body.classList.add('fixed', 'inset-x-0', 'overflow-hidden');
    this.containerTarget.classList.remove(this.toggleClass);
    document.body.insertAdjacentHTML('beforeend', this.backgroundHtml);
    this.background = document.querySelector(`#${this.backgroundId}`);
  }

  close() {
    if (typeof event !== 'undefined') {
      event.preventDefault()
    }
    this.containerTarget.classList.add(this.toggleClass);
    if (this.background) { this.background.remove() }
  }

  _backgroundHTML() {
    return `<div id="${this.backgroundId}" class="overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full" aria-modal="true" role="dialog" style="background-color: rgba(0, 0, 0, 0.7); z-index: 9998;"></div>`;
  }
}