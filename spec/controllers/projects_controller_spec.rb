require 'spec_helper'

describe ProjectsController do
  describe "GET edit" do
    let(:project) { mock_model(Project).as_null_object }
    context "when current user owns the project" do
      before do
        Project.stub(:find).with(1).and_return(project)
        get :edit, :id => 1
      end

      it "should check whether current user is owner"

      it "should assign project" do
        assigns[:project].should eq(project)
      end

      it "should give succes response" do
        response.should be_succes
      end
    end

    context "when current user does not own the project" do
      it "should check and fail whether current user is owner"
      it "should redirect back to project show"
    end


    it "should give response succes"
    describe "GET show" do
      context "when the project exists" do
        let(:project) { mock_model(Project).as_null_object }
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
        let(:project) { mock_model(Project).as_null_object }
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
  end

  describe "POST create" do
    let(:project) { mock_model(Project).as_null_object }
    let(:membership) { mock_model(Project::Membership).as_null_object }

    context "when a user is logged on" do
      let(:current_user) { mock_model(User).as_null_object }

      before(:each) do
        controller.stub(:current_user).and_return(current_user)
        Project.should_receive(:new)
          .and_return(project)
        Project::Membership.should_receive(:new)
          .with(:project => project, :user => current_user)
          .and_return(membership)
        post :create
      end

      it "should create the project" do
        assigns[:project].should eq(project)
        assigns[:membership].should eq(membership)
      end

      it "should redirect to the project" do
        response.should redirect_to project_path(project)
      end
    end
  end

  describe "become_member" do
    it "should call Project.become_member with user"
    it "should redirect to back"
  end

  describe "invite_member" do
    it "should call Project.invite_member with user"
    it "should redirect to back"
  end
end
