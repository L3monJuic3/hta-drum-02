import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["current", "past"]

  activate(event) {
    event.preventDefault()
    this.currentTarget.classList.remove("hidden")
    this.pastTarget.classList.add("hidden")
  }
}
