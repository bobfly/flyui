module Forms
  class InputComponent < ViewComponent::Base
    def initialize(form:, method:, type: :text, placeholder: nil, fetch_url: nil, create_url: nil, param_name: nil, enum: nil, initial_name: nil, **options)
      @form = form
      @method = method
      @type = type
      @placeholder = placeholder
      @fetch_url = fetch_url
      @create_url = create_url
      @param_name = param_name
      @enum = enum
      @initial_name = initial_name
      @options = options
    end

    def classes
      base_classes = "input input-bordered w-full max-w-xs"
      error? ? "#{base_classes} input-error" : base_classes
    end

    def label_text
      @form.object.class.human_attribute_name(@method)
    end

    def error?
      @form.object.errors[@method].present?
    end

    def error_messages
      @form.object.errors[@method].join(", ")
    end

    def toggle?
      @type == :boolean
    end

    def date_picker?
      @type == :date
    end

    def date_time_picker?
      @type == :datetime
    end

    def dropdown?
      @type == :dropdown
    end

    def simple_dropdown?
      @type == :simple_dropdown
    end
  end
end
