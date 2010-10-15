class User < ActiveRecord::Base
  include ActiveModel::Validations
  acts_as_authentic do |c|
    c.login_field= :username
  end

  has_many :memberships, :class_name => "Project::Membership"
  has_many :projects, :through => :memberships
  has_one :profile

  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  validates :first_name,:presence => true
  validates :last_name, :presence => true
  validates :title, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :gender, :presence => true
  # Custom validator
  #validates :first_name, :last_name, :different_names => true
  validate :different_names
  
  def name
    first_name + ' ' + last_name
  end

  def different_names
    errors.add(:base, "first name and last name are the same") if (first_name.eql?(last_name))
  end
end