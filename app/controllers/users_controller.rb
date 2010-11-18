class UsersController < ApplicationController
  before_filter :navigation

  def home
    @random_users = User.find(:all, :include => :profile).shuffle.first(12)
    render :layout => 'exhibition'
  end

  # GET /users
  def index
    @users = User.all.sort_by { |user| user.profile.name }
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    if current_user.present?
      @user = User.find(params[:id])
    else
      redirect_to user_url(params[:id]), :notice => "You cannot edit this user since you are not logged in."
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @profile = User::Profile.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    @profile = @user.build_profile(params[:profile])
    if @user.save
      # TODO e-mail is not added and because of that an error is generated and you can't register because of the next line. Fix this
      @user.profile.deliver_activation_instructions!
      redirect_to(@user, :notice => 'User was successfully created.')
    else
      flash[:notice] = 'Creating new user failed'
      render :action => "new"
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User updated succesfully'
      redirect_to :action => 'show'
    else
      flash[:notice] = 'Updating user failed'
      redirect_to :action => 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url)
  end

  private

  def navigation
    @nav = 'Members'
  end
end
