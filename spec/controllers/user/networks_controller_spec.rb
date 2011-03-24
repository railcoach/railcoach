require 'spec_helper'

describe User::NetworksController do
  
  describe "GET edit" do
    let(:user) { mock_model(User).as_null_object }

    context "is connected to more than 0 networks" do
      before(:each) do
        user.stub(:get_connectable_networks).and_return(["google", "github"])
        user.stub(:get_connected_networks).and_return(["facebook"])
        controller.stub(:current_user) {user}
      end

      it "gets connectable networks" do
        user.should_receive(:get_connectable_networks)
        get :edit, :id => user
        assigns[:connectable_networks].should eq(["google", "github"])
      end

      it "gets connected networks" do
        user.should_receive(:get_connected_networks)
        get :edit, :id => user
        assigns[:connected_networks].should eq(["facebook"])
      end

      it "responds with success" do
        get :edit, :id => user
        response.should be_success
      end

      it "renders edit template" do
        get :edit, :id => user
        response.should render_template('networks/edit')
      end
    end

    context "is connected to 0 networks" do
      before(:each) do
        user.stub(:get_connectable_networks).and_return(["facebook","google", "github"])
        user.stub(:get_connected_networks).and_return([])
        controller.stub(:current_user) {user}
      end

      it "gets connectable networks" do
        user.should_receive(:get_connectable_networks)
        get :edit, :id => user
        assigns[:connectable_networks].should eq(["facebook","google", "github"])
      end

      it "gets connected networks" do
        user.should_receive(:get_connected_networks)
        get :edit, :id => user
        assigns[:connected_networks].should eq([])
      end

      it "renders edit template" do
        get :edit, :id => user
        response.should render_template('networks/edit')
      end
    end
  end
end
