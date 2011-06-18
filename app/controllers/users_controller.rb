class UsersController < ApplicationController
  before_filter :navigation
  load_and_authorize_resource

  def home
    @random_users = User.find(:all, :include => :profile).shuffle.first(12)
    render :layout => 'exhibition' unless user_signed_in?
  end

  # GET /users
  def index
    @users = User.all.sort_by { |user| user.profile.fullname }
  end

  # GET /users/1
  def show
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to(users_url)
  end

  private

  def navigation
    @nav = 'Members'
  end
end
