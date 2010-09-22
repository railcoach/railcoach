class AddLoginToUser < ActiveRecord::Migration
  def self.up
    add_column 'users', 'crypted_password', :string
    add_column 'users', 'username', :string
    add_column 'users', 'email', :string
    add_column 'users', 'password_salt', :string
    add_column 'users', 'persistence_token', :string
  end

  def self.down
    remove_column :users, [ :crypted_password, :username, :email, :password_salt, :persistence_token ]
  end
end
