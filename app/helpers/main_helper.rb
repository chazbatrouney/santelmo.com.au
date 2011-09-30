module MainHelper
  def line_break(width = 29)
    content_tag :span, :class => 'line_break' do
      "&#8226;".html_safe * width
    end
  end
end
