class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
  def html_container(html)
    ul = tag(:ul, html, :class => 'pagination justify-content-center')
    tag(:nav, ul)
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
    html_element = tag(:span, text, :class => 'page-link')
    page_item(html_element, disabled: true)
  end

  def page_number(page)
    html_element = link(page, page, :rel => rel_value(page), :class => 'page-link')
    page_item(html_element, active: page == current_page)
  end

  def previous_or_next_page(page, text, classname)
    html_element = link(text, page, :class => 'page-link')
    page_item(html_element, disabled: !page)
  end

  def page_item(element, disabled: false, active: false)
    html_class = 'page-item'
    html_class += ' disabled' if disabled
    html_class += ' active' if active
    tag(:li, element, :class => html_class)
  end
end