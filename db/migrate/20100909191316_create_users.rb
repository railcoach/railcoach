class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      # Devise fields
      # see also: https://github.com/plataformatec/devise/wiki/How-To:-Upgrade-to-Devise-2.0-migration-schema-style

      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :limit => 128, :null => false, :default => ""

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      ## Recoverable
      t.string   :reset_password_token
      #t.datetime :reset_password_sent_at # Added in later migration

      ## Rememberable
      t.string   "remember_token" # In original schema.rb, not on the wiki page!
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
