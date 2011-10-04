module ApplicationHelper
  def nav_link(text, path)
    link = line_break + link_to(text, path)
    
    if current_page? path
      link += image_tag("cross.png", :size => "24x24", :alt => "Active Cross", :class => "active_link")
    end
    
    link
  end
  
  def line_break(width = 29)
    content_tag :div, :class => 'line_break' do
      "&#8226;".html_safe * width
    end
  end
end
