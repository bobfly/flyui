# frozen_string_literal: true

module Cards
  class CardComponent < ViewComponent::Base
    renders_one :body_content
    renders_one :actions

    def initialize(as: :neutral, title: nil)
      @as = as
      @title = title
    end

    def card_classes
      case @as
      when :primary
        "bg-primary text-primary-content"
      when :secondary
        "bg-secondary text-secondary-content"
      when :neutral
        "bg-neutral text-neutral-content"
      end
    end
  end
end
