module ApplicationHelper
  def nav_link(text, path, current = nil)
    current ||= current_page?(path)
    
    content_tag :div, :class => 'link' + (current ? ' current' : '') do
      link = line_break + link_to(text, path, :class => 'pjax')
      
      link += link_to(main_index_path, :class => 'pjax') do 
        content_tag(:div, "", :class => "active_link cross")
      end 
      
      link
    end
    
  end
  
  def line_break(width = 29)
    content_tag :div, :class => 'line_break' do
      "&#8226;".html_safe * width
    end
  end
end
