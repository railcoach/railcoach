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

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      @user.save do |result|
        if result
          format.html { redirect_to(root_url, :notice => 'User was successfully created.') }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml

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
