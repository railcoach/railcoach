class StaticController < ApplicationController
  def home
    @nav = 'Home'

    render :layout => "exhibition" unless @current_user.present?
  end

  def news
    @nav = 'News'

    render :layout => "exhibition" unless @current_user.present?
  end

  def about
    @nav = 'About'

    render :layout => "exhibition" unless @current_user.present?
  end
end
