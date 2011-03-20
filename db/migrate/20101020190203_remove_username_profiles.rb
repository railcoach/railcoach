class RemoveUsernameProfiles < ActiveRecord::Migration
  def self.up
    remove_column :user_profiles, :username
  end

  def self.down
    add_column :user_profiles, :username, :string
  end
end
