class AddTwitterToProfile < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :twitter, :string
  end

  def self.down
    remove_column :user_profiles, :twitter
  end
end
