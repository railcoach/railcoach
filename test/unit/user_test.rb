require 'test_helper'

# This is the sloppiest test ever written by a newbie in RoR.
# Please, do not consider murdering me as valid option
# Thank you

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  test "should not save an invalid user" do
    user = User.new
    assert !user.save, "Saved user without any attribute"
    assert user.errors[:email]
    assert user.errors[:password]
    assert !(user.valid?), "User is valid without any attribute"
    assert !user.save, "User save without any attribute"
  end

  test "should not save an user without email" do
    user = User.new
    assert user.password = 'somepassword'
    assert !(user.valid?), 'User is invalid: no email'
    assert !user.save, "Saved user without email"
  end

  test "should not save an user without password" do
    user = User.new
    assert user.email = users(:manuell).email
    assert !(user.valid?), 'User is invalid: no password'
    assert !user.save, "Saved user without password"
  end
end