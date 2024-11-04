import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dismiss() {
    this.element.remove() // Remove the toast from the DOM
  }
}