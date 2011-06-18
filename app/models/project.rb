class Project < ActiveRecord::Base
  acts_as_paranoid
  has_many :roles, :as => 'rollable'

  has_many :memberships, :class_name => "Project::Membership", :dependent => :destroy
  has_many :users, :through => :memberships

  def accepted_memberships
    memberships.where( :state => :accepted )
  end

  def pending_memberships
    memberships.where( :state => :join_request )
  end

  def request_membership(user)
    Project::Membership.create_membership_request(self,user)
  end

  def invite_member(user)
    Project::Membership.create_invitation(self, user)
  end

  def owners
    self.memberships.joins(:roles).where("project_roles.name = ?", "owner").collect(&:user)
  end
end
