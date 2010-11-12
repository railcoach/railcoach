class User < ActiveRecord::Base
  include ActiveModel::Validations
  acts_as_authentic do |c|
    c.login_field= :username
  end

  attr_accessible :username, :email, :password, :password_confirmation

  has_many :memberships, :class_name => "Project::Membership"
  has_many :projects, :through => :memberships
  has_one :profile
  has_many :owned_projects, :class_name => "Project"

  validates :username, :presence => true, :uniqueness => true
  
  # This should not be validated! crypted_password should be!
  #validates :password, :presence => true
  #validates :password_confirmation, :presence => true
  validates :crypted_password, :presence => true

  def activate!
    self.active = true
    save
  end

  def email
    self.profile.email
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

  def deliver_welcome!
    reset_perishable_token!
    Notifier.deliver_welcome(self)
  end

  # Checks for string role on integer(id) project
  # Gets all memberships where project_id = project, gets rolls associated and maps the names of those in an array, then checks whether role is included in the array.
  def has_role_on_project?(role, project)
      membership = self.memberships.find_by_project_id(project)
      unless membership.blank?
        membership.roles.collect{ |r| r.name}.include?(role) if not membership.roles.empty?
      else
        false
      end
 
  end
    
end
