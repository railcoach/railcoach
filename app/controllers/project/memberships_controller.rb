class Project::MembershipsController < ApplicationController
  # GET /memberships
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  def show
    @membership = Membership.find(params[:id])
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  def create
    @membership = Membership.new(params[:membership])

    if @membership.save
      redirect_to(@membership, :notice => 'Membership was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /memberships/1
  def update
    @membership = Membership.find(params[:id])

    if @membership.update_attributes(params[:membership])
      redirect_to(@membership, :notice => 'Membership was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /memberships/1
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to(memberships_url)
  end
end
