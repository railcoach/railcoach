class AddStateToProjectMembership < ActiveRecord::Migration
  def self.up
    add_column :project_memberships, :state, :string
  end

  def self.down
    remove_column :project_memberships, :state
  end
end
