class RemoveEmailProfiles < ActiveRecord::Migration
  def self.up
    remove_column :user_profiles, :email
  end

  def self.down
    add_column :user_profiles, :email, :string
  end
end
