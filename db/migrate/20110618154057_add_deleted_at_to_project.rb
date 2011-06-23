class AddDeletedAtToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :deleted_at, :datetime
  end

  def self.down
    remove_column :projects, :deleted_at
  end
end
