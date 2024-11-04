class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def input(method, type: :text, placeholder: nil, **options)
    @template.render Forms::InputComponent.new(
      form: self,
      method: method,
      type: type,
      placeholder: placeholder,
      **options
    )
  end
end
