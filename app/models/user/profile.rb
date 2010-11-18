class User::Profile < ActiveRecord::Base
  belongs_to :user

#  validates :email, :presence => true, :uniqueness => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create}
#  # do NOT turn on presence validations, it prevents creating an empty profile for a new user.

  def fullname
    if !first_name.nil? and !last_name.nil?
       return first_name + ' ' + last_name
    elseif !first_name.nil?
        return first_name
    else
        return user.username
    end
  end

  def different_names
    errors.add(:base, "first name and last name are the same") if (first_name.eql?(last_name))
  end
end
