class Project::Membership < ActiveRecord::Base
  belongs_to :project, :class_name => "Project"
  belongs_to :user, :class_name => "User"
  has_and_belongs_to_many :roles, :class_name => "Project::Role", :join_table => "project_memberships_roles"

  state_machine :initial => :none do
    event :accept_member do
      transition :join_request => :accepted
    end

    event :accept_invitation do
      transition :invitation => :accepted
    end
  end

  def self.create_membership_invitation(project, user)
    Project::Membership.create(:project => project, :user => user, :state => "invitation")
  end

  def self.create_membership_request(project, user)
    Project::Membership.create(:project => project, :user => user, :state => "join_request")
  end
end
