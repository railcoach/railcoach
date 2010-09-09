class User < ActiveRecord::Base
  has_many :memberships

  has_many :projects, :through => :memberships

  has_one :profile
end
