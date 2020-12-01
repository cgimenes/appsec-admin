require_relative 'bootstrap_form'

class BootstrapRansackFormBuilder < Ransack::Helpers::FormBuilder
  include BootstrapForm

  def search_field(method, options = {})
    merge_class! options, 'form-control'
    super
  end

  # todo reaproveitar código
  def select(method, choices = nil, options = {}, html_options = {}, &block)
    merge_class! html_options, 'form-control'
    super
  end

  def submit(value = nil, options = {})
    merge_class! options, 'btn btn-outline-primary'
    super
  end

  def date_field(method, **options)
    merge_class! options, 'form-control'
    super
  end
end