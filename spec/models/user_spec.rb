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

  context "that is already created" do
    before(:each) do
      @user = User.new     
    end
  end

  it "should be invalid without a name" do
    @user.should_not be_valid
    @user.email = 'abcde@abcde.com'
    @user.password = 'abcdefg'
    @user.title = 'Software Developer'
    @user.gender = 'm'
    @user.first_name = 'Edgar'
    @user.last_name = 'Dijkstra'
    @user.errors.on(:username)
    @user.usernamea = 'edijkstra'
    @user.should be_valid
  end
end
