require Rails.root.join("app/form_builders/custom_form_builder")

ActionView::Base.default_form_builder = CustomFormBuilder
