class User::Profile < ActiveRecord::Base
  belongs_to :user

  validates :email, :presence => true, :uniqueness => true
  validates :first_name,:presence => true
  validates :last_name, :presence => true
  validates :title, :presence => true
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
