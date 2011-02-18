class AddAcceptanceToProjectMemberships < ActiveRecord::Migration
  def self.up
    add_column :project_memberships, :user_accepted, :boolean, :default => false, :null => false
    add_column :project_memberships, :project_accepted, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :project_memberships, :user_accepted
    remove_column :project_memberships, :project_accepted
  end
end