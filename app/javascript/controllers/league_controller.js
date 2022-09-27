import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  show () {
    alert('hey from stimulus')
  }
}