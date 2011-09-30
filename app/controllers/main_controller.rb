class MainController < ApplicationController
  def splash
    render :layout => "splash"
  end
  
  def index
  end
  
  def main
  end
  
  def philosophy
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
    @images = ['/images/gallery/thumbnail-1.jpg', '/images/gallery/thumbnail-1.jpg', '/images/gallery/thumbnail-1.jpg', '/images/gallery/thumbnail-1.jpg']
  end

end
