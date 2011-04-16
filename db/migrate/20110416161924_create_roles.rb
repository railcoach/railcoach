class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.references :user
      t.references :rollable, :polymorphic => true
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
