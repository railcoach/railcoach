class StaticController < ApplicationController
  layout "static"

  def home
    @nav = 'Home'

    render :layout => "exhebition"
  end

  def projects
    @nav = 'Projects'
  end

  def members
    @nav = 'Members'
  end

  def news
    @nav = 'News'
  end

  def about
    @nav = 'About'
  end
end