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

  def bam2011s
    @nav = 'BAM2011S'

    render :layout => "exhibition"
  end
end
