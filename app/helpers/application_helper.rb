module ApplicationHelper
  include Pagy::Frontend



  def date_range_filter(form, start_field:, end_field:, placeholder: "Select date range")
    date_range_value = ""

    if params[:q].present? && params[:q][start_field].present? && params[:q][end_field].present?
      date_range_value = "#{params[:q][start_field]} to #{params[:q][end_field]}"
    end

    content_tag(:div, data: { controller: "date-range" }) do
      form.label(:date_range, "Date Range", class: "block text-sm font-medium text-gray-700") +
      form.text_field(:date_range, placeholder: placeholder, value: date_range_value, data: { date_range_target: "visibleInput" }, class: "input input-bordered w-full") +
      form.hidden_field(start_field, value: params.dig(:q, start_field), data: { date_range_target: "startDate" }) +
      form.hidden_field(end_field, value: params.dig(:q, end_field), data: { date_range_target: "endDate" })
    end
  end
end
