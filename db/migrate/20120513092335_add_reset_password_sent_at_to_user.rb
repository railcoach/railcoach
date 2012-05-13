class AddResetPasswordSentAtToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :reset_password_sent_at, :datetime
  end

  def self.down
    remove_column :users, :reset_password_sent_at
  end
end
