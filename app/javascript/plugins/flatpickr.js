import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#range_start", {
  minDate: "today",
  altInput: true,
  disableMobile: "true",
  plugins: [new rangePlugin({ input: "#range_end"})]
});
