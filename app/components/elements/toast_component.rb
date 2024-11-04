module Elements
  class ToastComponent < ViewComponent::Base
    # Define the component’s initializer
    def initialize(message:, status: :notice)
      @message = message
      @status = status.to_sym
    end

    # Determine the appropriate CSS classes based on the status
    def toast_classes
      base_classes = "alert shadow-lg p-4 rounded-lg flex items-center justify-between gap-4"
      case @status
      when :notice
        "#{base_classes} alert-success"
      when :alert
        "#{base_classes} alert-error"
      else
        base_classes
      end
    end
  end
end
