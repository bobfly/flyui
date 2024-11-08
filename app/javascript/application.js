// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import { createIcons, icons } from "lucide";

// Function to initialize icons
function initializeIcons() {
  createIcons({ icons });
}

// Initialize icons on initial page load
document.addEventListener("DOMContentLoaded", initializeIcons);

// Re-initialize icons after Turbo frame or Turbo Stream load
document.addEventListener("turbo:load", initializeIcons);
document.addEventListener("turbo:frame-render", initializeIcons);
document.addEventListener("turbo:render", initializeIcons);

// Update the URL with search parameters when the search form is submitted
document.addEventListener("turbo:submit-end", (event) => {
  // Check if the form submission was successful and if it’s the search form
  if (event.detail.success && event.target.matches("[data-search-form='true']")) {
    const url = new URL(window.location);
    const formData = new FormData(event.target);

    // Update the URL with search parameters
    for (const [key, value] of formData.entries()) {
      if (value) {
        url.searchParams.set(key, value);
      } else {
        url.searchParams.delete(key);
      }
    }

    // Replace the current history state with the new URL
    window.history.replaceState({}, "", url);
  }
});