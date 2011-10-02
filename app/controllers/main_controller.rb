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
  
  def gallery
    @images = ['/images/gallery/thumbnail-1.jpg', '/images/gallery/thumbnail-2.jpg', '/images/gallery/thumbnail-3.jpg', '/images/gallery/thumbnail-4.jpg', '/images/gallery/thumbnail-5.jpg', '/images/gallery/thumbnail-6.jpg']
  end

end
