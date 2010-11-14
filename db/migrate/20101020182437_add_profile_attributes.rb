class AddProfileAttributes < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :gender, :string
    add_column :user_profiles, :title, :string
    add_column :user_profiles, :username, :string
    add_column :user_profiles, :email, :string
    add_column :user_profiles, :first_name, :string
    add_column :user_profiles, :last_name, :string
    remove_column :user_profiles, :description
  end

  def self.down
    remove_column :user_profiles, [:gender, :title, :username, :email, :first_name, :last_name]
    add_column :user_profiles, :description, :text
  end
end
