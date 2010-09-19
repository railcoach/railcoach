class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
