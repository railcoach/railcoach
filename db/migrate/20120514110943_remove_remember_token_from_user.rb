class RemoveRememberTokenFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :remember_token
  end

  def down
    # Only needed for Devise < 2
    add_column :users, :remember_token, :string
  end
end
