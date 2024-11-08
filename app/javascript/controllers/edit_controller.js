import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "form"]

  showForm(event) {
    event.preventDefault()
    this.cardTarget.style.display = "none"
    this.formTarget.style.display = "block"
  }

  cancel(event) {
    event.preventDefault()
    this.formTarget.style.display = "none"
    this.cardTarget.style.display = "block"
  }
}