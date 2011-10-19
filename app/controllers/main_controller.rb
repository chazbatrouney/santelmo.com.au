class MainController < ApplicationController
  def splash
    render :layout => "splash"
  end
  
  def index
    render :layout => "background"
  end
  
  def main
  end
  
  def philosophy
    render :layout => "background"
  end

  def menu
    render :layout => "background"
  end

  def drinks
    render :layout => "background"
  end

  def reservations
    render :layout => "background"
  end

  def gallery
  end

  def press
  end

  def contact
    render :layout => "background"
  end
  
  N_IMAGES_PER_PAGE = 6
  def gallery
    params[:page] ||= 1
  
    @all_images = [
      {:title => "Image One", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-1.jpg'},
      {:title => "Image Two", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-2.jpg'},
      {:title => "Image Three", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-3.jpg'},
      {:title => "Image Four", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-4.jpg'},
      {:title => "Image Five", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-5.jpg'},
      {:title => "Image Six", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-6.jpg'},
      {:title => "Image Seven", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-7.jpg'},
      {:title => "Image Eight", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-8.jpg'},
      {:title => "Image Nine", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Image Ten", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-10.jpg'},
      {:title => "Image Nine", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Image Nine", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Image Nine", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Image Nine", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Image Nine", :url => 'image-2.jpg', :thumbnail_url => 'thumbnail-9.jpg'}
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
