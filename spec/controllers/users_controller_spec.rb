require 'spec_helper'

describe UsersController do
  describe "GET index" do
    let(:users) { [mock_model(User).as_null_object] }
    before do
      User.stub(:all).and_return(users)
      get :index
    end

    it "should return some users" do
      assigns[:users].should eq(users)
    end

    it "responds with success" do
      response.should be_success
    end
  end

  describe "GET show" do
    context "when the user exists" do
      let(:user) { mock_model(User).as_null_object }
      before do
        User.stub(:find).with(1).and_return(user)
        get :show, :id =>1
      end
      it "should return the user" do
        assigns[:user].should eq user
      end
    end
  end

  describe "GET home" do
    context "when there are no users" do
      it "should not display any users" do
        User.stub(:all).and_return([])
        get :home
        assigns[:random_users].should eq []
      end
    end

    context "when there are users" do
      let(:users) {[mock_model(User).as_null_object]}
      before(:each) do
        User.stub(:find).with(:all, {:include=>:profile}).and_return(users)
      end

      it "should shuffle the user list" do
        User.stub(:shuffle).and_return(users.shuffle)
        User.stub(:first).with(12).and_return(users)
        get :home
        assigns[:random_users].should eq users
      end

      # Note: This should be configurable
      it "should return 12 users" do
        User.stub(:shuffle).and_return(users)
        User.stub(:first).with(12).and_return(users.first(12))
        get :home
        assigns[:random_users].size.should eq users.first(12).size
      end

      it "should return the first 12 items of the shuffled list" do
        User.stub(:shuffle).and_return(users.shuffle)
        User.stub(:first).with(12).and_return(users.first(12))
        get :home
        assigns[:random_users].should eq users.shuffle.first(12)
      end
    end
  end
end
