require 'spec_helper'

describe User do
  context "when first created" do
    before(:each) do
      @user = User.new
    end

    it "should have a profile" do
      @user.profile.should_not be_nil
    end

    it "should not save example" do
      @user.should_not be_valid
    end
  end

  context "when fully created" do
    before(:each) do
      @user = User.new
      @user.email = 'edsgerd@example.com'
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.profile.first_name = 'Edsger'
      @user.profile.last_name = 'Dijkstra'
      @user.profile.title = 'Genius'
      @user.profile.gender = 'm'
    end

    it "should be valid" do
      @user.should be_valid
    end

    it "should not be valid without an email" do
      @user.email = nil
      @user.should_not be_valid
    end
  end

  describe "#destroy" do
    it "should set deleted_at" do
      user = User.new
      user.deleted_at.should be_nil
      user.destroy
      user.deleted_at.should_not be_nil
    end
  end
end
