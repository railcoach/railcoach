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
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to(@project, :notice => 'Project was successfully created.')
    else
      render :action => "new"
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
