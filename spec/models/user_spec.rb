require 'spec_helper'

describe User do
  context "when first created" do
    before(:each) do
      @user = User.new
    end

    it "should not save example" do
      @user.should_not be_valid
    end
  end

  context "when fully created" do
    before(:each) do
      @user = User.new
      @user.username = 'edsgerd'
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.first_name = 'Edsger'
      @user.last_name = 'Dijkstra'
      @user.email = 'edsgerd@example.com'
      @user.title = 'Genius'
      @user.gender = 'm'
    end

    it "should be valid" do
      @user.should be_valid
    end

    it "should not be valid without a username" do
      @user.username = nil
      @user.should_not be_valid
    end

    it "should not be valid with an invalid e-mail" do
      @user.email = 'Muhahaha'
      @user.should_not be_valid
    end
  end
end
