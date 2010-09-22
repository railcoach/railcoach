class User < ActiveRecord::Base
  acts_as_authentic

  has_many :memberships, :class_name => "Project::Membership"
  has_many :projects, :through => :memberships
  has_one :profile
end
