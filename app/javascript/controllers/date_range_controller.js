import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["visibleInput", "startDate", "endDate"];

  connect() {
    const startDate = this.startDateTarget.value;
    const endDate = this.endDateTarget.value;
    
    flatpickr(this.visibleInputTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      defaultDate: startDate && endDate ? [startDate, endDate] : null,
      onChange: this.setDateRange.bind(this),
    });
  }

  setDateRange(selectedDates) {
    const [startDate, endDate] = selectedDates;
    if (startDate) this.startDateTarget.value = this.formatDate(startDate);
    if (endDate) this.endDateTarget.value = this.formatDate(endDate);
  }

  formatDate(date) {
    return date.toISOString().split("T")[0];
  }
}
