require 'spec_helper'

describe UsersController do
  it "should return some users" do
    get :index

    assigns[:users].should == User.all.to_a
  end

  it "should return a user" do
    user = User.new( :id => 1 )
    User.stub(:find).with(1).and_return(user)
    get :show, { :id => 1 }

    assigns[:user].should == User.find(1)
  end
end
