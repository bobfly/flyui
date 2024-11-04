# frozen_string_literal: true

module Cards
  class DummyComponent < ViewComponent::Base
    # Expose the dummy object to the template
    def initialize(dummy:)
      @dummy = dummy
    end

    # Helper methods for display logic
    def formatted_started_at
      @dummy.started_at.strftime("%B %d, %Y")
    end

    def formatted_completed_at
      @dummy.completed_at.strftime("%B %d, %Y %I:%M %p")
    end

    def active_status
      @dummy.active ? "Yes" : "No"
    end

    def status_text
      @dummy.status_text
    end
  end
end
