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
  end

  def drinks
  end

  def reservations
  end

  def gallery
  end

  def press
  end

  def contact
  end
  
  N_IMAGES_PER_PAGE = 6
  def gallery
    params[:page] ||= 1
  
    @all_images = [
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-1.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-2.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-3.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-4.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-5.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-6.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-7.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-8.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-9.jpg'},
      {:title => "Tom's Name", :url => 'base-1.jpg', :thumbnail_url => 'thumbnail-10.jpg'}
    ]
    
    first_image = (params[:page].to_i - 1) * N_IMAGES_PER_PAGE
    @images = @all_images[first_image, N_IMAGES_PER_PAGE]
  end

end
