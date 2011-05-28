class Project::Membership < ActiveRecord::Base
  belongs_to :project, :class_name => "Project"
  belongs_to :user, :class_name => "User"
  validates_uniqueness_of :project_id, :scope => :user_id

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
