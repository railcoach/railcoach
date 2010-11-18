class User::ProfilesController < ApplicationController
  # GET /profiles
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  def create
    @profile = Profile.new(params[:profile])

    if @profile.save
      redirect_to(@profile, :notice => 'Profile was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /profiles/1
  def update
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
    if @profile.update_attributes(params[:user_profile])
      flash[:notice] = 'Profile updated succesfully'
      redirect_to (@user)
    else
      flash[:notice] = 'Updating profile failed'
      redirect_to :action => 'edit'
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to(profiles_url)
  end
end
