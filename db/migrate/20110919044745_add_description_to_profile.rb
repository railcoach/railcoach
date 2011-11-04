class AddDescriptionToProfile < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :description, :string
  end

  def self.down
    remove_column :user_profiles, :description
  end
end
