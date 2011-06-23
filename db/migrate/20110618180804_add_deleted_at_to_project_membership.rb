class AddDeletedAtToProjectMembership < ActiveRecord::Migration
  def self.up
    add_column :project_memberships, :deleted_at, :datetime
  end

  def self.down
    remove_column :project_memberships, :deleted_at
  end
end
