class ProjectsController < ApplicationController
  before_filter :navigation

  # GET /projects/home
  def home
    @random_projects = Project.all.shuffle.first(2)

    render :layout => 'exhibition' unless user_signed_in?
  end

  # GET /projects
  def index
    @projects = Project.all :order => 'name ASC'
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
#    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
#    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
#    @project = Project.new(params[:project])
#    # TODO give the new membership an admin role within the project
#    @membership = Project::Membership.new(:project => @project, :user => current_user)
#
#    @membership.roles << Project::Role.find_by_name('owner')
#    # TODO use transaction
#    if @project.save and @membership.save
#      redirect_to(@project, :notice => 'Project was successfully created.')
#    else
#      render :action => "new"
#    end
  end

  # PUT /projects/1
  def update
#    @project = Project.find(params[:id])
#
#    if @project.update_attributes(params[:project])
#      redirect_to(@project, :notice => 'Project was successfully updated.')
#    else
#      render :action => "edit"
#    end
  end

  # DELETE /projects/1
  def destroy
#    @project = Project.find(params[:id])
#    @project.destroy
#    redirect_to(projects_url)
  end

  # PUT /project/1/request_membership
  def request_membership
#    project = Project.find(params[:id])
#    project.request_membership(current_user)
#
#    redirect_to :back
  end

  # PUT /project/1/invite_member
  def invite_member
#    user = User.find(params[:user_id])
#    project = Project.find(params[:id])
#    project.invite_member(user)
#
#    redirect_to :back
  end

  private

  def navigation
    @nav = 'Projects'
  end
end
