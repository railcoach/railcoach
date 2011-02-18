class Project < ActiveRecord::Base
  has_many :memberships, :class_name => "Project::Membership"
  has_many :users, :through => :memberships

  def become_member(user)
    create_membership(user, true, false)
  end

  def invite_member(user)
    create_membership(user, false, true)
  end
  
  private
  
  def create_membership(user, user_accepted, project_accepted)
    role = Project::Role.first(:conditions => {:name => 'member'})
    Project::Membership.create(:user => user, :project => self, :roles => [role], :user_accepted => user_accepted, :project_accepted => project_accepted)
  end
end
