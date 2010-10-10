class UsersController < ApplicationController
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
end
