class Project::Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :roles, :class_name => "Project::Role"
end
