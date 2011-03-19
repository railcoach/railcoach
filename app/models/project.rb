class Project < ActiveRecord::Base
  has_many :memberships, :class_name => "Project::Membership"
  has_many :users, :through => :memberships

  def request_membership(user)
    Project::Membership.create_membership_request(self,user)
  end

  def invite_member(user)
    Project::Membership.create_invitation(self, user)
  end
end
