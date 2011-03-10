class RemoveUsersAttributes < ActiveRecord::Migration
  def self.up
    remove_column :users, [:gender, :title, :first_name, :last_name]
  end

  def self.down
    add_column :users, :gender, :string
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
