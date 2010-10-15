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

<<<<<<< HEAD
  def new
    @user = User.new(params[:user])
=======
  # GET /users/new
  def new
    @user = User.new
>>>>>>> 15543acf7abfad3ed9f541e3f360c3ba53465bc7
  end

  # POST /users
  def create
    @user = User.new(params[:user])
<<<<<<< HEAD
    if @user.save
      redirect_to root_url
    else
      render :action => :new
=======
    
    if @user.save
      flash[:notice] = 'Successfully created user'
      redirect_to(@user, :notice => 'User was successfully created.')
    else
      flash[:notice] = 'Creating new user failed'
      render :action => "new"
>>>>>>> 15543acf7abfad3ed9f541e3f360c3ba53465bc7
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
end
