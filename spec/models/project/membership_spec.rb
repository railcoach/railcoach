require 'spec_helper'

describe Project::Membership do
  let(:project) { mock_model("Project", :id => 12) }
  let(:user) { mock_model("User", :id => 13) }

  describe "create_membership_request" do
    it "should create a new instance with state :join_request" do
      proc {
        Project::Membership.create_membership_request( project, user )
      }.should change(Project::Membership, :count).by(1)
    end

    describe "the new instance" do
      before(:each) do
        Project::Membership.create_membership_request( project, user )

        @membership = Project::Membership.last
      end

      subject { @membership }

      its(:project_id) { should == project.id }
      its(:user_id) { should == user.id }
      its(:state) { should == "join_request" }
    end

    context "when a membership already exists" do
      before(:each) do
        Project::Membership.create_membership_request( project, user )
      end

      it "should not create a new instance" do
        proc {
          Project::Membership.create_membership_request( project, user )
        }.should_not change(Project::Membership, :count)
      end
    end
  end

  describe "create_membership_invitation" do
    it "should set project_accepted to true and save it" do
      proc {
        Project::Membership.create_membership_invitation( project, user )
      }.should change(Project::Membership, :count).by(1)
    end

    describe "the new instance" do
      before(:each) do
        Project::Membership.create_membership_invitation( project, user )

        @membership = Project::Membership.last
      end

      subject { @membership }

      its(:project_id) { should == project.id }
      its(:user_id) { should == user.id }
      its(:state) { should == "invitation" }
    end

    context "when a membership already exists" do
      before(:each) do
        Project::Membership.create_membership_invitation( project, user )
      end

      it "should not create a new instance" do
        proc {
          Project::Membership.create_membership_invitation( project, user )
        }.should_not change(Project::Membership, :count)
      end
    end
  end
end
