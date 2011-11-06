class StaticController < ApplicationController
  skip_authorization_check

  def home
    @nav = 'Home'

    render :layout => "exhibition" unless user_signed_in?
  end

  def news
    @nav = 'News'

    render :layout => "exhibition" unless user_signed_in?
  end

  def about
    @nav = 'About'

    render :layout => "exhibition" unless user_signed_in?
  end

  def privacy
    @nav = 'About'
  end

  def contact
    @nav = 'About'
  end

  def bam2011s
    @nav = 'BAM2011S'

    render :layout => "exhibition"
  end

  def sag2012w
    @nav = 'SAG2012W'

    render :layout => "exhibition"
  end

  def boot
    @nav = 'boot'

    render :layout => "exhibition"
  end
end
