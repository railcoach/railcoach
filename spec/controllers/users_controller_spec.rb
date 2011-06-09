require 'spec_helper'

describe UsersController do
  describe "PUT update" do
    let(:user) { mock_model(User).as_null_object }
    before do
      User.stub(:find).and_return(user)
      user.should_receive(:update_attributes).and_return(true)
      put :update, :id => 1
    end
    it "responds with redirect to show" do
      response.should redirect_to :action => :show
    end
  end

  describe "GET edit" do
    let(:user) { mock_model(User).as_null_object }
    before do
      User.stub(:find).and_return(user)
      get :edit, :id => 1
    end
    it "should return the user" do
      assigns[:user].should eq user
    end
    it "responds with success" do
      response.should be_success
    end
  end

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
      # Return two arrays. - Contents does not matter (in specs, views are not rendered),
      # so filling them with ints works fine
      let(:users) {[*1..15] }
      let(:shuffled_list) {[*2..13]}

      before(:each) do
        User.stub(:find).with(:all, {:include=>:profile}).and_return(users)

        users.stub(:shuffle).and_return(shuffled_list)
      end

      it "should shuffle the user list" do
        User.stub(:first).with(12).and_return(users)
        get :home
        assigns[:random_users].should eq shuffled_list
      end

      # Note: This should be configurable
      it "should return 12 users" do
        get :home
        assigns[:random_users].size.should eq users.first(12).size
      end

      it "should return the first 12 items of the shuffled list" do
        get :home
        assigns[:random_users].should eq users.shuffle.first(12)
      end
    end
  end
end
