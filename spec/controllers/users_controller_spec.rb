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

  context "home" do
    context "when there are no users" do
      it "should not display any users" do
        User.stub(:all).and_return([])

        get :home

        assigns[:random_users].should == []
      end
    end

    context "when there are users" do
      before(:each) do
        shuffled_list = [*1..15]

        User.stub_chain( :all, :shuffle ).and_return(shuffled_list)
      end

      it "should shuffle the user list" do
        user_list = mock('user_list')
        user_list.should_receive(:shuffle).and_return([])

        User.stub(:all).and_return(user_list)
        get :home
      end

      # Note: This should be configurable
      it "should return 12 users" do
        get :home

        assigns[:random_users].size.should == 12
      end

      it "should return the first 12 items of the shuffled list" do
        get :home

        assigns[:random_users].should == [*1..12]
      end
    end
  end
end
