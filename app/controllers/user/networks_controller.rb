class User::NetworksController < ApplicationController
  def edit
    @connected_networks = current_user.get_connected_networks
    @connectable_networks = current_user.get_connectable_networks
  end
end
