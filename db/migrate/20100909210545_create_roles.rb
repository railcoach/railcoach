class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.integer :membership_id

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
