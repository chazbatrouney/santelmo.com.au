DynamicSitemaps::Sitemap.draw do
  
  # default per_page is 50.000 which is the specified maximum.
  per_page 10

  url main_index_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_philosophy_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_menu_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_drinks_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_reservations_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_gallery_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_press_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  url main_employment_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  
end