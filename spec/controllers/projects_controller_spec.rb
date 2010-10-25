require 'spec_helper'

describe ProjectsController do
  describe "GET show" do
    context "when the project exists" do
      let(:project) { mock_model(Project).as_null_object }
      before do
        Project.should_receive(:find).with(1).and_return(project)
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
      it "redirects to projects index" do
        pending
      end

      it "sets error message that project does not exist" do
        pending
      end
    end

  end
end
