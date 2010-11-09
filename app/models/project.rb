class Project < ActiveRecord::Base
  has_many :memberships, :class_name => "Project::Membership"
  has_many :users, :through => :memberships
  belongs_to :owner, :class_name => "User"
end
