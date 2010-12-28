class User::ProfilesController < ApplicationController
  # GET /profiles/1/edit
  def edit
    @profile = User::Profile.find(params[:id])
  end

  # PUT /profiles/1
  def update
    @profile = User::Profile.find(params[:id])
    @user = @profile.user
    if @profile.update_attributes(params[:user_profile])
      flash[:notice] = 'Profile updated succesfully'
      redirect_to (@user)
    else
      flash[:notice] = 'Updating profile failed'
      render :action => 'edit'
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile = User::Profile.find(params[:id])
    @profile.destroy
    redirect_to(profiles_url)
  end
end
