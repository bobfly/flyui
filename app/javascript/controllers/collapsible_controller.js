import { Controller } from "@hotwired/stimulus"
import { createIcons, icons } from "lucide";

export default class extends Controller {
  static targets = ["content", "icon"]

  toggle() {
    this.contentTarget.classList.toggle("hidden")

    // Toggle icon between chevron-down and chevron-up
    const iconName = this.contentTarget.classList.contains("hidden") ? "chevron-down" : "chevron-up";
    this.iconTarget.setAttribute("data-lucide", iconName);

    // Re-render the Lucide icon to update it
    createIcons({ icons });
  }
}