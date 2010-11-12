class Project::Role < ActiveRecord::Base
  has_and_belongs_to_many :memberships, :class_name => "Project::Membership", :join_table => "project_memberships_roles"
end
