require 'test_helper'
require 'users_controller'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  setup do
    @user = users(:manuell)
  end

  test "index without user logged in" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "show" do
    post :show
    assert_response :success
    assert_template :show
  end

  test "edit" do
    post :edit, {}, { :user_id => users(:manuell).id, :user_last_name => users(:manuell).last_name }
    assert_response :success
    assert_template :edit
  end

  test "new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "create" do
    post :create
    assert_response :success
    assert_template :new
  end

  test "update" do
    post :update, {}, { :user_id => users(:manuell).id }
    assert_response :success
    assert_template :update
  end
end