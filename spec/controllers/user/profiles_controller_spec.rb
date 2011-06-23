require 'spec_helper'

describe User::ProfilesController do
  let(:current_user) { mock_model(User).as_null_object }

  before do
    controller.stub(:current_user).and_return(current_user)
  end

  describe "GET edit" do
    let(:profile) { mock_model(User::Profile).as_null_object }
    before do
      User::Profile.stub(:find).with(profile).and_return(profile)
      get :edit, :id => profile
    end

    it "should assign the correct profile" do
      assigns[:profile].should eq profile
    end
  end

  describe "POST update" do
  # Some simple mocks
    
    context "given the data is valid" do
      let(:profile) { mock_model(User::Profile).as_null_object }

      before do
        User::Profile.stub!(:find).with(profile).and_return(profile) # Stub the model, so we just asume that the data exists and works
        profile.stub!(:user).and_return(current_user) # Because we dont care if the relationship doesnt work, else profile has a nil relationship

        put :update, :id => profile
      end

      it "should find the profile and its user" do
        # Note that we're only checking on working instance variables, nothing more
        assigns[:profile].should eq profile
        assigns[:user].should eq current_user
      end

      it "should update the profile" do
        # Nice huh.
        profile.should_receive(:update_attributes).with(profile).and_return(true)
        put :update, :id => profile, :user_profile => profile # put to profiles#update
      end

      it "should set a notice" do
        # I only care if the message is set
        flash[:notice].should_not be_blank
      end

      it "should redirect to user" do
        # Simple redirect test
        response.should redirect_to user_path(current_user)
      end
    end

    context "given the data is invalid" do
      let(:profile) { mock_model(User::Profile).as_null_object }

      before do
        User::Profile.stub!(:find).with(profile).and_return(profile) # Stub the model, so we just asume that the data exists and works
        profile.stub!(:user).and_return(current_user) # Because we dont care if the relationship doesnt work, else profile has a nil relationship
        profile.stub!(:update_attributes).and_return(false)
      end

      def do_request
        put :update, :id => profile, :user_profile => profile # put to profiles#update
      end

      it "should not update attributes" do
        profile.should_receive(:update_attributes).with(profile).and_return(false)
        do_request
      end

      it "should set a flash message" do
        do_request
        flash[:notice].should_not be_blank
      end

      it "should render action edit" do
        do_request
        response.should render_template('user/profiles/edit') 
      end
    end
  end
end
