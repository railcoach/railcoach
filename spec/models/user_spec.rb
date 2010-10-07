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
      @user = User.new do |u|
        u.first_name = 'Edsger'
        u.last_name = 'Dijkstra'
        u.title = 'Genius'
      end
    end

    it "should have a name" do
      @user.name.should == 'Edsger Dijkstra'
    end

    it "should have a title" do
      @user.title.should == 'Genius'
    end

    it "should be male" do
      @user.gender.should == 'm'
    end
  end
end
