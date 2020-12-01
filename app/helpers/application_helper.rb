module ApplicationHelper
  def bootstrap_form_for(record, options = {}, &block)
    options.merge! builder: BootstrapFormBuilder
    form_for record, options, &block
  end

  def bootstrap_form_with(**options, &block)
    form_with(**options.merge(builder: BootstrapFormBuilder), &block)
  end

  def flash_class(level)
    case level
    when 'notice' then
      'alert-info'
    when 'success' then
      'alert-success'
    when 'error' then
      'alert-danger'
    when 'alert' then
      'alert-warning'
    else
      'alert-primary'
    end
  end

  def inside_layout(layout = "application", &block)
    render inline: capture(&block), layout: "layouts/#{layout}"
  end

  def render_markdown(markdown)
    Rails.application.config.markdown_renderer.render(markdown || "").html_safe
  end
end
