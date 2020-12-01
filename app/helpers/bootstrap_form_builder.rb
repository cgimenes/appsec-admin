require_relative 'bootstrap_form'

class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  include BootstrapForm

  alias_method :parent_text_field, :text_field
  alias_method :parent_password_field, :password_field
  alias_method :parent_select, :select

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if !instance.is_a?(ActionView::Helpers::Tags::Label) && instance.object.errors.any?
      next "#{html_tag}<div class=\"invalid-feedback\">#{instance.object.errors.full_messages_for(instance.instance_variable_get('@method_name'))[0]}</div>".html_safe
    end
    next html_tag
  end

  def submit(value = nil, options = {})
    merge_class! options, 'btn btn-primary'
    super
  end

  def select(method, choices = nil, options = {}, html_options = {}, with_label = true, &block)
    form_group do
      ungrouped_select method, choices, options, html_options, with_label, &block
    end
  end

  def ungrouped_select(method, choices = nil, options = {}, html_options = {}, with_label = true, &block)
    merge_class! html_options, 'form-control'
    merge_class! html_options, 'is-invalid' if @object.errors.full_messages_for(method).any?
    (with_label ? label(method) : "".html_safe) + parent_select(method, choices, options, html_options, &block)
  end

  def date_field(method, with_label: true, **options)
    merge_class! options, 'is-invalid' if @object.errors.full_messages_for(method).any?
    merge_class! options, 'form-control'
    form_group do
      (with_label ? label(method) : "".html_safe) + super(method, options)
    end
  end

  def text_field(method, **options)
    form_group do
      label(method) + (ungrouped_text_field method, options)
    end
  end

  def ungrouped_text_field(method, **options)
    merge_class! options, 'is-invalid' if @object.errors.full_messages_for(method).any?
    merge_class! options, 'form-control'
    parent_text_field method, options
  end

  def password_field(method, **options)
    form_group do
      label(method) + (ungrouped_password_field method, options)
    end
  end

  def ungrouped_password_field(method, **options)
    merge_class! options, 'form-control'
    parent_password_field method, options
  end

  def text_area(method, with_label: true, **options)
    merge_class! options, 'form-control'
    merge_class! options, 'is-invalid' if @object.errors.full_messages_for(method).any?
    form_group do
      (with_label ? label(method) : "".html_safe) + super(method, options)
    end
  end

  def check_box(method, options = {})
    merge_class! options, 'form-check-input'
    form_group({class: 'form-check'}) do
      super(method, options) + label(method, class: 'form-check-label')
    end
  end

end