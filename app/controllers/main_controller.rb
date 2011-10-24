class MainController < ApplicationController

  N_IMAGES_PER_PAGE = 6
  def gallery
    params[:page] ||= 1
  
    @all_images = [
      {:title => "Did someone say bar?", :url => 'image-1.jpg', :thumbnail_url => 'thumbnail-1.jpg'},
      {:title => "By the window for two", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-2.jpg'},
      {:title => "That's a door", :url => 'image-3.jpg', :thumbnail_url => 'thumbnail-3.jpg'},
      {:title => "Come in...", :url => 'image-4.jpg', :thumbnail_url => 'thumbnail-4.jpg'},
      {:title => "San Telmo outdoor area", :url => 'image-5.jpg', :thumbnail_url => 'thumbnail-5.jpg'},
      {:title => "Fresh food", :url => 'image-6.jpg', :thumbnail_url => 'thumbnail-6.jpg'},
      {:title => "Wine only for the gods", :url => 'image-7.jpg', :thumbnail_url => 'thumbnail-7.jpg'},
      {:title => "Our famous register", :url => 'image-8.jpg', :thumbnail_url => 'thumbnail-8.jpg'},
      {:title => "Yes, this is our famous register", :url => 'image-9.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Inside the main restaurant", :url => 'image-10.jpg', :thumbnail_url => 'thumbnail-10.jpg'},
      {:title => "Sauces, so many sauces", :url => 'image-11.jpg', :thumbnail_url => 'thumbnail-11.jpg'},
      {:title => "Did I say sauces?", :url => 'image-12.jpg', :thumbnail_url => 'thumbnail-12.jpg'},
      {:title => "White fist with your favourite glass of wine", :url => 'image-13.jpg', :thumbnail_url => 'thumbnail-13.jpg'},
      {:title => "We love the bar, so you will", :url => 'image-14.jpg', :thumbnail_url => 'thumbnail-14.jpg'},
      {:title => "Quiet table in the corner", :url => 'image-15.jpg', :thumbnail_url => 'thumbnail-15.jpg'}
    ]
    
    @current_page = params[:page].to_i || 1
    
    @next_page = @current_page + 1
    @next_page = nil if @current_page * N_IMAGES_PER_PAGE >= @all_images.length
    
    @previous_page = @current_page - 1
    @previous_page = nil if @previous_page < 1

    first_image = (@current_page - 1) * N_IMAGES_PER_PAGE
    @images = @all_images[first_image, N_IMAGES_PER_PAGE]
  end
end
