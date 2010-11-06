require 'spec_helper'

describe ProjectsController do
  describe "GET show" do
    context "when the project exists" do
      let(:project) { mock_model(Project).as_null_object }
      before do
        Project.stub(:find).with(1).and_return(project)
        get :show, :id => 1
      end

      it "returns a project object and should be equal" do
        assigns[:project].should eq(project)
      end

      it "responds with success" do
        response.should be_success
      end
    end

    context "when the project does not exists" do
      let(:project) { mock_model(Project).as_null_object }
      before do
        Project.stub(:find).with(666).and_return(false)
        get :show, :id => 666
      end
      it "redirects to projects index" do
        response.should redirect_to :action => "index"
      end

      it "sets error message that project does not exist" do
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

    it "responds with success" do
      response.should be_success
    end
  end

  describe "GET home" do
    let(:projects) { [mock_model(Project).as_null_object] * 20 }
    before do
      Project.stub(:all).and_return(projects)
      get :home
    end

    it "should return two items of the shuffled list" do
      assigns[:random_projects].length.should == 2
    end

    it "responds with success" do
      response.should be_success
    end
  end
end
