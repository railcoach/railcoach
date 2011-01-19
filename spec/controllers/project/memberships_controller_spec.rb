# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Project::MembershipsController do
  before(:each) do
    @memberships_controller = Project::MembershipsController.new
  end

  describe "POST request_membership" do
    let(:project) { mock_model(Project).as_null_object }
    let(:current_user) { mock_model(User).as_null_object }
    let(:membership) { mock_model(Project::Membership).as_null_object }

    before(:each) do
      controller.stub(:current_user).and_return(current_user)
      Project::Membership.should_receive(:new).and_return(membership)
    end

    context "given the data is valid data" do
      before(:each) do
        post :request_membership, :id => 666
      end

      it "should create the membership" do
        assigns[:membership].should eq(membership)
      end

      it "should redirect to the project" do
        response.should redirect_to project_path(project)
      end
    end

    context "given the data is invalid" do
      before(:each) do
        post :request_membership
      end

      it "should not create the membership" do
        assigns[:membership].should eq(null)
      end

      it "should redirect to the project" do
        response.should redirect_to project_path(project)
      end
    end
  end
end

