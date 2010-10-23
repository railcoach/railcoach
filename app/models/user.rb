class User < ActiveRecord::Base
  include ActiveModel::Validations
  acts_as_authentic do |c|
    c.login_field= :username
  end
  
  has_many :memberships, :class_name => "Project::Membership"
  has_many :projects, :through => :memberships
  has_one :profile
  
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
end