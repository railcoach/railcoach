require 'spec_helper'

describe ActivationsController do
  describe 'POST create' do
    context 'given the user and token exists' do
      let(:user) { mock_model(User).as_null_object }
      it "should find the user" do
        User.stub(:find_by_perishable_token).with("sometoken").and_return(user)
        post :create, :activation_code => "sometoken"
        assigns[:user] eq(user)
      end

      it "should login the user"
      it "should deliver the welcome message"
      it "should redirect to account_url"
        post :create, :activation_code => "sometoken"
        response.should redirect_to(account_url)
      end
    end

end
