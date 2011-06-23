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

  describe "dependent memberships" do
    before(:each) do
      @valid = { :name => 'Homo!', :description => 'Lorem smipsum'}
      @user = User.create!(:email => 'test@test.com', :password => 'testadfasdfas')
      @p = Project.new(@valid).owner(@user)
      @p.save!
    end
    it "should create a membership" do
      @p.memberships.size.should == 1
    end

    it "should set the user as owner" do
      @p.memberships.first.user.should be(@user)
    end

    it "should save the membership if project is saved" do
      Project.first.memberships.count.should == 1
    end

    it "should have a member that is an owner" do
      @p.memberships.first.user.is_owner_of?(@p).should == true
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
