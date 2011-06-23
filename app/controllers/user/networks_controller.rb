class User::NetworksController < ApplicationController
  skip_authorization_check

  def edit
    @connected_networks = current_user.get_connected_networks
    @connectable_networks = current_user.get_connectable_networks
  end
end
