require 'test_helper'

# This is the sloppiest test ever written by a newbie in RoR.
# Please, do not consider murdering me as valid option
# Thank you

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  test "should not save an invalid user" do
    user = User.new
    assert !user.save, "Saved user without any attribute"
    assert user.errors.on(:first_name)
    assert user.errors.on(:last_name)
    assert user.errors.on(:email)
    assert user.errors.on(:title)
    assert user.errors.on(:username)
    assert user.errors.on(:gender)
    assert user.errors.on(:password)
    assert user.errors.on(:password_confirmation)
    assert !(user.valid?), "User is valid without any attribute"
    assert !user.save, "User save without any attribute"
  end

  test "should not save an user without username" do
    user = User.new
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).first_name
    assert user.title = users(:manuell).title
    assert user.email = users(:manuell).email
    assert user.gender = users(:manuell).gender
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no username'
    assert !user.save, "Saved user without username"
  end

  test "should not save an user without first name" do
    user = User.new
    assert user.last_name = users(:manuell).last_name
    assert user.username = users(:manuell).username
    assert user.email = users(:manuell).email
    assert user.title = users(:manuell).title
    assert user.gender = users(:manuell).gender
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no first name'
    assert !user.save, "Saved user without first name"
  end

  test "should not save an user without last name" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.first_name = users(:manuell).first_name
    assert user.title = users(:manuell).title
    assert user.email = users(:manuell).email
    assert user.gender = users(:manuell).gender
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no last name'
    assert !user.save, "Saved user without last name"
  end

  test "should not save an user without email" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).first_name
    assert user.title = users(:manuell).title
    assert user.gender = users(:manuell).gender
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no email'
    assert !user.save, "Saved user without email"
  end

  test "should not save an user without password" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).first_name
    assert user.title = users(:manuell).title
    assert user.email = users(:manuell).email
    assert user.gender = users(:manuell).gender
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no password'
    assert !user.save, "Saved user without password"
  end

  test "should not save an user without password confirmation" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).first_name
    assert user.title = users(:manuell).title
    assert user.email = users(:manuell).email
    assert user.gender = users(:manuell).gender
    assert user.password = 'somepassword'
    assert !(user.valid?), 'User is invalid: no password confirmation'
    assert !user.save, "Saved user without password confirmation"
  end

  test "should not save an user without title" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).first_name
    assert user.email = users(:manuell).email
    assert user.gender = users(:manuell).gender
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no title'
    assert !user.save, "Saved user without title"
  end

  test "should not save an user without gender" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).first_name
    assert user.title = users(:manuell).title
    assert user.email = users(:manuell).email
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: no gender'
    assert !user.save, "Saved user without gender"
  end

  test "a" do
    user = User.new
    assert user.username = users(:manuell).username
    assert user.last_name = users(:manuell).last_name
    assert user.first_name = users(:manuell).last_name
    assert user.title = users(:manuell).title
    assert user.email = users(:manuell).email
    assert user.password = 'somepassword'
    assert user.password_confirmation = 'somepassconfirmation'
    assert !(user.valid?), 'User is invalid: same first name and last name'
    assert !user.save, "Saved user with same first name and last name"
  end
end