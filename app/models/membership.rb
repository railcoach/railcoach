class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :roles
end
