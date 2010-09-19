class Project::Role < ActiveRecord::Base
  belongs_to :membership, :class_name => "Project::Membership"
end
