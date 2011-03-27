class StaticController < ApplicationController
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
end
