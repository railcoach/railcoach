require 'spec_helper'

module AuthorizationExampleHelpers
  def should_respond_with_access_denied(action)
    describe action do
      it "should respond with access denied" do
        put action, :membership_id => membership, :project_id => project.id
        response.status.should eq(403)
      end
    end
  end
end

describe Project::MembershipsController do
  extend AuthorizationExampleHelpers

  let (:membership) { mock_model(Project::Membership).as_null_object }
  let (:project) { mock_model(Project).as_null_object }

  before do
    Project::Membership.stub(:find).with(membership.id.to_s).and_return(membership)
    membership.stub(:project).and_return(project)
    request.env["HTTP_REFERER"] = "http://example.com/"
  end

  context "when no user logged in" do
    [:accept_invitation, :accept_member, :deny].each do |action|
      should_respond_with_access_denied action
    end
  end

  context "when user logged in" do
    let (:current_user) { mock_model(User).as_null_object }

    before do
      controller.stub(:current_user).and_return(current_user)
      current_user.stub(:is_owner_of?).with(project).and_return(false)
    end

    context "and invited for the project" do
      before do
        membership.stub(:user).and_return(current_user)
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

      should_respond_with_access_denied :accept_member

      describe "deny" do
        it "should call destroy" do
          membership.should_receive(:destroy)
          put :deny, :membership_id => membership, :project_id => project.id
        end

        it "should redirect to back" do
          put :deny, :membership_id => membership, :project_id => project.id
          response.should redirect_to :back
        end
      end
    end

    context "and owner of the project" do
      before do
        current_user.stub(:is_owner_of?).with(project).and_return(true)
      end

      should_respond_with_access_denied :accept_invitation

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
        it "should call destroy" do
          membership.should_receive(:destroy)
          put :deny, :membership_id => membership, :project_id => project.id
        end

        it "should redirect to back" do
          put :deny, :membership_id => membership, :project_id => project.id
          response.should redirect_to :back
        end
      end
    end

    context "and not invited and not owner of the project" do
      should_respond_with_access_denied :accept_invitation
      should_respond_with_access_denied :accept_member
      should_respond_with_access_denied :deny
    end
  end
end
