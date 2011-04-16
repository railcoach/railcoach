class RemoveAcceptanceFromProjectMembership < ActiveRecord::Migration
  def self.up
    remove_column :project_memberships, :user_accepted
    remove_column :project_memberships, :project_accepted
  end

  def self.down
    add_column :project_memberships, :user_accepted, :boolean, :default => false, :null => false
    add_column :project_memberships, :project_accepted, :boolean, :default => false, :null => false
  end
end
