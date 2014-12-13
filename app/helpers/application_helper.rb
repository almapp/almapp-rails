module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def css(css)
    content_for(:css) { css }
  end

  def js(javascript)
    content_for(:js) { javascript }
  end

end
