module MainHelper
  def line_break
    content_tag :span, :class => 'line_break' do
      "&#8226;".html_safe * 29
    end
  end
  def heading_break
    content_tag :span, :class => 'line_break' do
      "&#8226;".html_safe * 151
    end
  end
end
