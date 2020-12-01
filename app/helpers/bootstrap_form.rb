module BootstrapForm
  def form_group(html_options = {}, &block)
    merge_class! html_options, 'form-group'
    @template.content_tag(:div, html_options) do
      block.call
    end
  end

  def merge_class!(options, clazz)
    options.merge! class: [(options[:class] || []), [clazz]].flatten
  end
end