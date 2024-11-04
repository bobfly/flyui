module Forms
  class InputComponent < ViewComponent::Base
    def initialize(form:, method:, type: :text, placeholder: nil, **options)
      @form = form
      @method = method
      @type = type
      @placeholder = placeholder
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
  end
end
