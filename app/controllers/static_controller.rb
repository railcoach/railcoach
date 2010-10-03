class StaticController < ApplicationController

  def home
    @nav = 'Home'

    render :layout => "exhibition"
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
