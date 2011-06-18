require 'spec_helper'

describe ProjectsController do
  let(:project) { mock_model(Project).as_null_object }
  let(:current_user) { mock_model(User).as_null_object }

  before do
    controller.stub(:current_user).and_return(current_user)
    request.env["HTTP_REFERER"] = "http://example.com/"
  end

  describe "GET edit" do
    before do
      Project.stub(:find).with(1).and_return(project)
    end

    context "when current user owns the project" do
      before do
        current_user.stub(:is_owner_of?).with(project).and_return(true)
        get :edit, :id => 1
      end

      it "should assign project" do
        assigns[:project].should eq(project)
      end

      it "should give succes response" do
        response.should be_succes
      end
    end

    context "when current user does not own the project" do
      before do
        current_user.stub(:is_owner_of?).with(project).and_return(false)
      end

      it "should give access denied response" do
        lambda { get :edit, :id => 1 }.should raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe "GET show" do
    context "when the project exists" do
      before do
        Project.stub(:find).with(1).and_return(project)
        get :show, :id => 1
      end

      it "should return a project object and should be equal" do
        assigns[:project].should eq(project)
      end

      it "should respond with success" do
        response.should be_success
      end
    end

    context "when the project does not exists" do
      before do
        Project.stub(:find).with(666).and_return(false)
        get :show, :id => 666
      end

      it "should redirect to projects index" do
        response.should redirect_to :action => "index"
      end

      it "should set error message that project does not exist" do
        flash[:error].should eq("This project does not exist (yet).")
      end
    end
  end

  describe "GET index" do
    let(:projects) { [mock_model(Project).as_null_object] }
    before do
      Project.stub(:all).and_return(projects)
      get :index
    end

    it "should return some projects" do
      assigns[:projects].should eq(projects)
    end

    it "should respond with success" do
      response.should be_success
    end
  end

  describe "GET home" do
    context "when enough projects exist" do
      let(:projects) { [mock_model(Project).as_null_object] * 20 }
      before do
        Project.stub(:all).and_return(projects)
        get :home
      end

      it "should return two items of the shuffled list" do
        assigns[:random_projects].length.should == 2
      end

      it "should respond with success" do
        response.should be_success
      end
    end

    context "when only one project exists" do
      let(:projects) { [mock_model(Project).as_null_object] }
      before do
        Project.stub(:all).and_return(projects)
        get :home
      end

      it "should return the project" do
        assigns[:random_projects].length.should == 1
      end

      it "should respond with success" do
        response.should be_success
      end
    end
  end

  describe "POST create" do
    let(:membership) { mock_model(Project::Membership).as_null_object }

    context "when a user is logged on" do
      before(:each) do
        Project.should_receive(:new)
          .and_return(project)
        Project::Membership.should_receive(:new)
          .with(:project => project, :user => current_user)
          .and_return(membership)
        # For some reason, which I haven't been able to figure out:
        # 0 post :create will call Project.new 0 times,
        # 1 post :create will call Project.new 2 times,
        # 2 post :create will call Project.new 3 times.
        # Commenting out all other specs in this file doesn't change this.
        # Project::Membership.new receives the correct number of calls.
        post :create
        #post :create
      end

#      it "blablabla" do
#      end

      it "should create the project"
#        assigns[:project].should eq(project)
#        assigns[:membership].should eq(membership)
#      end

      it "should redirect to the project"
#        response.should redirect_to project_path(project)
#      end
    end
  end

  describe "request_membership" do
    context "when a user is logged on" do
      before(:each) do
        Project.stub(:find).with(project.id).and_return(project)
      end

      it "should call Project.request_membership with user" do
        project.should_receive(:request_membership).with(current_user)
        post :request_membership, :id => project.id, :user_id => current_user.id
      end

      it "should redirect to back" do
        post :request_membership, :id => project.id, :user_id => current_user.id
        response.should redirect_to :back
      end
    end
  end

  describe "invite_member" do
    let(:user) { mock_model(User).as_null_object }

    before(:each) do
      Project.stub(:find).with(project.id).and_return(project)
      User.stub(:find).with(user.id).and_return(user)
    end

    it "should call Project.invite_member with user and project" do
      project.should_receive(:invite_member).with(user)
      post :invite_member, :user_id => user.id, :id => project.id
    end

    it "should redirect to the project" do
      post :invite_member, :user_id => user.id, :id => project.id
      response.should redirect_to :back
    end
  end

end
