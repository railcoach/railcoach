class CreateUserTokens < ActiveRecord::Migration
  def self.up
    create_table :user_tokens do |t|
      t.references :user
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end

  def self.down
    drop_table :user_tokens
  end
end
