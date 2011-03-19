class Project::Membership < ActiveRecord::Base
  belongs_to :project, :class_name => "Project"
  belongs_to :user, :class_name => "User"
  has_and_belongs_to_many :roles, :class_name => "Project::Role", :join_table => "project_memberships_roles"

  state_machine :initial => :none do
  end

  def accept_invitation
    self.user_accepted = true
    save
  end

  def accept_member
    self.project_accepted = true
    save
  end
end
