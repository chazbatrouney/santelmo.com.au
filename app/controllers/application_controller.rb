class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # cache all pages for 24 hours
  after_filter :cache_action 
  
  def cache_action
    return unless perform_caching
    
    response.headers['Cache-Control'] = 'public, max-age=86400'
    response.headers.delete('cookie')
  end
end
