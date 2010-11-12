class AddSetupHabtmRoleMemberships < ActiveRecord::Migration
  def self.up
    remove_column :projects, :owner_id
    remove_column :project_roles, :membership_id

    add_column :project_roles, :name, :string

    create_table :project_memberships_roles, :id => false do |t|
      t.references :membership
      t.references :role
    end
  end

  def self.down
    add_column :projects, :owner_id, :integer
    add_column :project_roles, :membership_id

    remove_column :project_roles, :name, :string

    drop_table :project_memberships_roles
  end
end
