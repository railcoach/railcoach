require 'spec_helper'

describe Project do
  describe "#request_membership" do
    it "should call Project::Membership.create_membership_request" do
      project = Project.new
      user = mock_model("User")

      Project::Membership.should_receive(:create_membership_request)

      project.request_membership(user)
    end
  end

  describe "#invite_member" do
    it "should call Project::Membership.create_membership_invitation" do
      project = Project.new
      user = mock_model("User")

      Project::Membership.should_receive(:create_invitation)

      project.invite_member(user)
    end
  end

  describe "#destroy" do
    it "should set deleted_at" do
      project = Project.new
      project.deleted_at.should be_nil
      project.destroy
      project.deleted_at.should_not be_nil
    end
  end
end
