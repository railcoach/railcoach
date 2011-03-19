require 'spec_helper'

describe User::NetworksController do
  describe "GET edit" do
    let(:current_user) { mock_model(User).as_null_object }

    context "is connected to more than 0 networks" do
      before(:each) do
        current_user.stub(:get_connectable_networks).and_return(["google", "github"])
        current_user.stub(:get_connected_networks).and_return(["facebook"])
      end

      it "gets connectable networks" do
        current_user.should_receive(:get_connectable_networks)
        get :edit
        assigns[:connectable_networks].should eq(["google", "github"])
      end

      it "gets connected networks" do
        current_user.should_receive(:get_connected_networks)
        get :edit
        assigns[:connected_networks].should eq(["facebook"])
      end

      it "renders edit template" do
        get :edit
        response.should render_template('networks/edit')
      end
    end

    context "is connected to 0 networks" do
      before(:each) do
        current_user.stub(:get_connectable_networks).and_return(["facebook","google", "github"])
        current_user.stub(:get_connected_networks).and_return([])
      end

      it "gets connectable networks" do
        current_user.should_receive(:get_connectable_networks)
        get :edit
        assigns[:connectable_networks].should eq(["facebook","google", "github"])
      end

      it "gets connected networks" do
        current_user.should_receive(:get_connected_networks)
        get :edit
        assigns[:connected_networks].should eq([])
      end

      it "renders edit template" do
        get :edit
        response.should render_template('networks/edit')
      end
    end
  end
end
