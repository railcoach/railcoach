require 'spec_helper'

describe Project do
  describe "become_member" do
    it "if should call create_membership"
  end

  describe "invite_member" do
    it "if should call create_membership"
  end

  describe "create_membership" do
    it "should create a new membership"
    context "when the membership is created" do
      it "should be connected to the project"
      it "should be connected to the user"
      it "should be connected to the role called 'member'"
      context "when the only user_accepted is true" do
        it "should set the user_accepted to true"
        it "should set the project_accepted to false"
      end
      context "when the only project_accepted is true" do
        it "should set the user_accepted to false"
        it "should set the project_accepted to true"
      end
    end
  end
end
