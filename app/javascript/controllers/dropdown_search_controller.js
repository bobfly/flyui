import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "list", "hiddenField"];
  static values = {
    fetchUrl: String,
    createUrl: String,
  };

  connect() {
    // Check if the hidden field has an initial value
    const initialId = this.hiddenFieldTarget.value;
    if (initialId) {
      const initialName = this.element.dataset.initialName; // Get the initial name from data attribute
      this.inputTarget.value = initialName; // Set the input field value
    }

  this.debouncedSearch = this.debounce(this.search.bind(this), 300);
    
  }

  search(event) {
    const query = event.target.value.trim();
    if (query.length < 2) return; // Avoid fetching for short queries

    fetch(`${this.fetchUrlValue}?q=${query}`, {
      headers: { "Accept": "application/json" },
      credentials: "same-origin",
    })
      .then((response) => {
        if (!response.ok) throw new Error("Failed to fetch manufacturers");
        return response.json();
      })
      .then((data) => this.updateList(data))
      .catch((error) => console.error(error));
  }

  updateList(data) {
    this.listTarget.innerHTML = ""; // Clear current list
    this.listTarget.classList.remove("hidden"); // Show dropdown

    // Add fetched items
    data.forEach((item) => {
      const option = document.createElement("li");
      const link = document.createElement("a");
      link.textContent = item.name;
      link.classList.add("cursor-pointer");
      link.dataset.action = "click->dropdown-search#select";
      link.dataset.id = item.id; // Attach dataset.id to the <a>
      option.appendChild(link);
      this.listTarget.appendChild(option);
    });

    // Add "Add New" option
    const addNewOption = document.createElement("li");
    const addNewLink = document.createElement("a");
    addNewLink.textContent = "Add New";
    addNewLink.classList.add("text-blue-500");
    addNewLink.dataset.action = "click->dropdown-search#create";
    addNewOption.appendChild(addNewLink);
    this.listTarget.appendChild(addNewOption);
  }

  select(event) {
    const target = event.target.closest("a"); // Get the closest <a> element
    if (!target) return; // Guard against invalid clicks

    const selectedId = target.dataset.id;
    const selectedName = target.textContent;

    this.hiddenFieldTarget.value = selectedId; // Set hidden field value
    this.inputTarget.value = selectedName; // Update input field
    this.listTarget.innerHTML = ""; // Clear dropdown
  }

  create() {
    const newValue = this.inputTarget.value.trim();
    if (!newValue) return;

    const parameterName = this.element.dataset.paramName; // Dynamically get the parameter name

    fetch(this.createUrlValue, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      credentials: "same-origin",
      body: JSON.stringify({ [parameterName]: { name: newValue } }), // Dynamic key based on paramName
    })
      .then((response) => {
        if (!response.ok) throw new Error("Failed to create");
        return response.json();
      })
      .then((data) => {
        this.hiddenFieldTarget.value = data.id; // Set new item ID
        this.inputTarget.value = data.name; // Set new item name
        this.listTarget.innerHTML = ""; // Clear dropdown
      })
      .catch((error) => console.error(error));
  }

  debounce(func, delay) {
    let timeoutId;
    return (...args) => {
      clearTimeout(timeoutId);
      timeoutId = setTimeout(() => func.apply(this, args), delay);
    };
  }
}
