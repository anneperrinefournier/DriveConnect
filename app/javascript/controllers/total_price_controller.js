import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin.js';


// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["total", "endDateInput"];
  static values = { days: Number }

  connect() {
    window.addEventListener("datepicker:dates-selected", (event) => {
      const { startDate, endDate, daysDifference } = event.detail;

      this.startDateValue = startDate;
      this.endDateValue = endDate;
      this.daysValue = daysDifference;

      this.calculateTotal();
      this.toggleEndDateVisibility();

    });
  }

  calculateTotal() {

    const day = this.daysValue;
    const price = document.querySelector(".price-per-day").innerHTML;

    const total_price = day * price;
    this.totalTarget.textContent = `${day} jours * ${price} € = ${total_price} €`;
  }
  toggleEndDateVisibility() {
    this.endDateInputTarget.classList.remove("d-none");
  }
}
