require 'spec_helper'

describe Project::MembershipsController do
  let (:membership) { mock_model(Project::Membership).as_null_object }
  let (:project) { mock_model(Project).as_null_object }

  before do
    Project::Membership.stub(:find).with(membership).and_return(membership)
    request.env["HTTP_REFERER"] = "http://example.com/"
  end

  context "when no user logged in" do
    [:accept_invitation, :accept_member, :deny].each do |action|
      describe action do
        it "should respond with access denied" do
          put action, :membership_id => membership, :project_id => project.id
          response.status.should eq(403)
        end
      end
    end
  end

  context "when user logged in" do
    let (:current_user) { mock_model(User).as_null_object }

    before do
      controller.stub(:current_user).and_return(current_user)
    end

    describe "accept_invitation" do
      it "should call accept_invitation" do
        membership.should_receive(:accept_invitation)
        put :accept_invitation, :membership_id => membership, :project_id => project.id
      end
      it "should redirect to back" do
        put :accept_invitation, :membership_id => membership, :project_id => project.id
        response.should redirect_to :back
      end
    end

    describe "accept_member" do
      it "should call accept_member" do
        membership.should_receive(:accept_member)
        put :accept_member, :membership_id => membership, :project_id => project.id
      end
      it "should redirect to back" do
        put :accept_member, :membership_id => membership, :project_id => project.id
        response.should redirect_to :back
      end
    end

    describe "deny" do
      it "should destroy the membership" do
        membership.should_receive(:destroy)
        put :deny, :membership_id => membership, :project_id => project.id
      end
      it "should redirect to back" do
        put :deny, :membership_id => membership, :project_id => project.id
        response.should redirect_to :back
      end
    end
  end
end
