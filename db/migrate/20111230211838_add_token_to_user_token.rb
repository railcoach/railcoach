class AddTokenToUserToken < ActiveRecord::Migration
  def self.up
    add_column :user_tokens, :token, :text
  end

  def self.down
    remove_column :user_tokens, :token
  end
end
