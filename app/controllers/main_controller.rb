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
      {:title => "", :url => 'image-15.jpg', :thumbnail_url => 'thumbnail-15.jpg'},
      {:title => "", :url => 'image-16.jpg', :thumbnail_url => 'thumbnail-16.jpg'},
      {:title => "", :url => 'image-17.jpg', :thumbnail_url => 'thumbnail-17.jpg'},
      {:title => "", :url => 'image-18.jpg', :thumbnail_url => 'thumbnail-18.jpg'},
      {:title => "", :url => 'image-19.jpg', :thumbnail_url => 'thumbnail-19.jpg'},
      {:title => "", :url => 'image-20.jpg', :thumbnail_url => 'thumbnail-20.jpg'},
      {:title => "", :url => 'image-21.jpg', :thumbnail_url => 'thumbnail-21.jpg'},
      {:title => "", :url => 'image-22.jpg', :thumbnail_url => 'thumbnail-22.jpg'},
      {:title => "", :url => 'image-23.jpg', :thumbnail_url => 'thumbnail-23.jpg'},
      {:title => "", :url => 'image-24.jpg', :thumbnail_url => 'thumbnail-24.jpg'},
      {:title => "", :url => 'image-25.jpg', :thumbnail_url => 'thumbnail-25.jpg'},
      {:title => "", :url => 'image-26.jpg', :thumbnail_url => 'thumbnail-26.jpg'},
      {:title => "", :url => 'image-27.jpg', :thumbnail_url => 'thumbnail-27.jpg'},
      {:title => "", :url => 'image-28.jpg', :thumbnail_url => 'thumbnail-28.jpg'},
      {:title => "", :url => 'image-29.jpg', :thumbnail_url => 'thumbnail-29.jpg'}
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
