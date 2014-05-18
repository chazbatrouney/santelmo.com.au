class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_tweets
  
  def load_tweets
    @tweets = $twitter_client.user_timeline(:count => 1)  # For this demonstration lets keep the tweets limited to the first 5 available.
  end
  
  # cache all pages for 24 hours
  after_filter :cache_action 
  
  def cache_action
    return unless perform_caching
    
    response.headers['Cache-Control'] = 'public, max-age=86400'
    response.headers.delete('cookie')
  end
  
end