class User::Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :gender, :title, :email

# TODO Fix validations, right now it prevents updating the profile or creating an empty one at registration 
#    validates :email, :uniqueness => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create}

  def name
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
