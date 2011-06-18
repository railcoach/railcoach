class User < ActiveRecord::Base
  acts_as_paranoid
  include Rollable::Base

  rollables Project, :roles =>  ["owner", "member", "pending"]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me



  has_many :memberships, :class_name => "Project::Membership", :dependent => :destroy
  has_many :projects, :through => :memberships
  has_one :profile
  has_many :owned_projects, :class_name => "Project"
  has_many :user_tokens
  has_many :roles

  #validates :username, :presence => true, :uniqueness => true
  #validates :profile, :presence => true
  # This should not be validated! crypted_password should be!
  #validates :password, :presence => true
  #validates :password_confirmation, :presence => true
  #validates :crypted_password, :presence => true

  after_initialize :create_defaults


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.user_tokens.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end

  def apply_omniauth(omniauth)
    # Maybe in profile, sometime
    #self.name = omniauth['user_info']['name'] if name.blank?
    #self.nickname = omniauth['user_info']['nickname'] if nickname.blank?

    unless omniauth['credentials'].blank?
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      user_tokens.build(:provider => omniauth['provider'], 
                        :uid => omniauth['uid'],
                        :token => omniauth['credentials']['token'], 
                        :secret => omniauth['credentials']['secret'])
    else
      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
    end
    #self.confirm!# unless user.email.blank?
  end

  def password_required?
    (user_tokens.empty? || !password.blank?) && super
  end

  # Returns all connected networks in array, if open_id just get from regex.
  # Author: Timon Vonk
  def get_connected_networks
    user_tokens.collect do |token|
      token.provider == 'open_id' ? token.uid.match(/\.(\w+)\./)[1] : token.provider
    end
  end
  
  def get_connectable_networks
    ['facebook', 'google', 'openid', 'github'] - get_connected_networks
  end

private

  def create_defaults
    self.profile ||= Profile.new(self)
  end

end
