class MainController < ApplicationController

  N_IMAGES_PER_PAGE = 6
  def gallery
    params[:page] ||= 1
  
    @all_images = [
      {:title => "", :url => 'image-1.jpg', :thumbnail_url => 'thumbnail-1.jpg'},
      {:title => "", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-2.jpg'},
      {:title => "", :url => 'image-3.jpg', :thumbnail_url => 'thumbnail-3.jpg'},
      {:title => "", :url => 'image-4.jpg', :thumbnail_url => 'thumbnail-4.jpg'},
      {:title => "", :url => 'image-5.jpg', :thumbnail_url => 'thumbnail-5.jpg'},
      {:title => "", :url => 'image-6.jpg', :thumbnail_url => 'thumbnail-6.jpg'},
      {:title => "", :url => 'image-7.jpg', :thumbnail_url => 'thumbnail-7.jpg'},
      {:title => "", :url => 'image-8.jpg', :thumbnail_url => 'thumbnail-8.jpg'},
      {:title => "", :url => 'image-9.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "", :url => 'image-10.jpg', :thumbnail_url => 'thumbnail-10.jpg'},
      {:title => "", :url => 'image-11.jpg', :thumbnail_url => 'thumbnail-11.jpg'},
      {:title => "", :url => 'image-12.jpg', :thumbnail_url => 'thumbnail-12.jpg'},
      {:title => "", :url => 'image-13.jpg', :thumbnail_url => 'thumbnail-13.jpg'},
      {:title => "", :url => 'image-14.jpg', :thumbnail_url => 'thumbnail-14.jpg'},
      {:title => "", :url => 'image-15.jpg', :thumbnail_url => 'thumbnail-15.jpg'}
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
