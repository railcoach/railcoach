class Project < ActiveRecord::Base
  acts_as_paranoid
  has_many :roles, :as => 'rollable'

  has_many :memberships, :class_name => "Project::Membership", :dependent => :destroy
  has_many :users, :through => :memberships

  before_save :setup_owner_membership
  after_save :set_owner_role

  def owner(user)
    @owner = user
    self
  end

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

  private
  def setup_owner_membership
    self.memberships.build(:user => @owner, :state => 'accepted')
  end

  def set_owner_role
    @owner.is_owner(self)
  end
end
