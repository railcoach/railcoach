class User::ProfilesController < ApplicationController
  load_and_authorize_resource :class => "User::Profile"

  # GET /profiles/1/edit
  def edit
    @user = @profile.user
  end

  # PUT /profiles/1
  def update
    @user = @profile.user
    if @profile.update_attributes(params[:user_profile])
      flash[:notice] = 'Profile updated succesfully'
      redirect_to user_path(@user.id)
    else
      flash[:notice] = 'Updating profile failed'
      render :action => 'edit'
    end
  end
end
