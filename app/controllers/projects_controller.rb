class ProjectsController < ApplicationController
  before_filter :navigation

  # GET /projects/home
  def home
    @random_projects = Project.all.shuffle.first(2)

    render :layout => 'exhibition'
  end

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])

    unless @project
      flash[:error] = "This project does not exist (yet)."
      redirect_to(projects_url)
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    unless @project.owner == current_user
      redirect_to project_url(params[:id]), :notice => "You cannot edit this project since you do not own it."
    end
  end

  # POST /projects
  def create
    if current_user
      @project = Project.new(params[:project])
      # TODO give the new membership an admin role within the project
      @membership = Project::Membership.new(:project => @project, :user => current_user)

      # TODO use transaction
      if @project.save and @membership.save
        redirect_to(@project, :notice => 'Project was successfully created.')
      else
        render :action => "new"
      end
    else
      # TODO fetch login path dynamically
      # TODO add some redirect_to= logic to login procedure
      redirect_to('/users/new')
    end
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to(@project, :notice => 'Project was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to(projects_url)
  end

  private

  def navigation
    @nav = 'Projects'
  end
end
