class RemoveUsersAttributes < ActiveRecord::Migration
  def self.up
    remove_column :users, :gender
    remove_column :users, :title
    remove_column :users, :email
    remove_column :users, :first_name
    remove_column :users, :last_name
  end

  def self.down
  end
end
