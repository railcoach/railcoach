# This migration fails if there are users with the same email modulo case.

class DowncaseEmail < ActiveRecord::Migration
  def up
    User.all.each do |u|
      u.update_attribute :email, u.email.downcase
    end
  end

  def down
  end
end
