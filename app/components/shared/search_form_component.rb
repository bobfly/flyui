module Shared
  class SearchFormComponent < ViewComponent::Base
    include Ransack::Helpers::FormHelper

    def initialize(form:, search_path:, main_filter: {}, additional_filters: [])
      @form = form
      @search_path = search_path
      @main_filter = main_filter
      @additional_filters = additional_filters
    end
  end
end
