module ApplicationHelper
  def default_button(name, path)
    link_to name, path, class: 'btn btn-default'
  end

  def primary_button(name, path)
    link_to name, path, class: 'btn btn-primary'
  end

  def danger_button(name, path, options = {})
    link_to name, path, {class: 'btn btn-danger'}.merge(options)
  end

  def success_label(caption)
    content_tag(:span, caption, class: 'label label-success')
  end

  def danger_label(caption)
    content_tag(:span, caption, class: 'label label-danger')
  end
end
