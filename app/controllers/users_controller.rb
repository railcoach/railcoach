class UsersController < ApplicationController
  before_filter :navigation

  def home
    @random_users = User.find(:all, :include => :profile).shuffle.first(12)
    render :layout => 'exhibition'
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new!(params[:user])
    @profile = @user.build_profile!(params[:profile])
    if (@profile.save! && @user.save!)
      flash[:notice] = 'Successfully created user'
      redirect_to(@profile, :notice => 'User was successfully created.')
    else
      flash[:notice] = 'Creating new user failed'
      render :action => "new"
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.profile.update_attributes(:first_name => params[:first_name], :last_name => params[:last_name], :gender => params[:gender], :title => params[:title], :email => params[:email])
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
