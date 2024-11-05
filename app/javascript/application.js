// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
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