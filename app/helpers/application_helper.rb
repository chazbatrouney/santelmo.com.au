module ApplicationHelper
  def nav_link(text, path, current = nil?)
    current ||= current_page?(path)
    
    content_tag :div, :class => 'link' + (current ? ' current' : '') do
      link = line_break + link_to(text, path, :class => 'pjax')
      
      link += link_to(main_index_path, :class => 'pjax') do 
        image_tag("cross.png", :size => "24x24", :alt => "Active Cross", :class => "active_link")
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
