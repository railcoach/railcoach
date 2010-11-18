class AddGenderToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :gender, :string
  end

  def self.down
    remove_column :users, :gender
  end
end
