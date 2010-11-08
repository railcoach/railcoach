class AddActiveAndPerishableTokensToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :active, :boolean, :default => false, :null => false
    add_column :users, :perishable_token, :string, :default => "", :null => false
    add_index :users, :perishable_token
  end

  def self.down
    remove_column :users, :persihable_token
  end
end
