# frozen_string_literal: true

module Elements
  class ButtonComponent < ViewComponent::Base
    def initialize(as: nil, title: nil, url: "#", size: nil, type: nil, outline: false, is_disabled: false)
      @as = as
      @title = title
      @url = url
      @size = size
      @type = type
      @outline = outline
      @is_disabled = is_disabled
    end

    def button_types
      case @as
      when :neutral
          "btn-neutral"
      when :primary
          "btn-primary"
      when :secondary
          "btn-secondary"
      when :accent
          "btn-accent"
      when :info
          "btn-info"
      when :success
          "btn-success"
      when :warning
          "btn-warning"
      when :error
          "btn-error"
      when :ghost
          "btn-ghost"
      when :link
          "btn-link"
      when :outline
          "btn-outline"
      when :active
          "btn-active"
      when :disabled
          "btn-disabled"
      when :glass
          "btn-glass"
      else
          "btn"
      end
    end

    def button_size
      case @size
      when :lg
          "btn-lg"
      when :md
          "btn-md"
      when :sm
          "btn-sm"
      when :xs
          "btn-xs"
      end
    end

    def button_type
      case @type
      when :wide
          "btn-wide"
      when :circle
          "btn-circle"
      when :block
          "btn-block"
      when :square
          "btn-square"
      end
    end

    def button_classes
      classes = "btn #{button_size} #{button_types} #{button_type}"
      classes += " btn-outline" if @outline == true
      classes
    end
  end
end
