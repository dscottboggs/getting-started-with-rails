require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "new" do
    tc = UsersController.new.new
    assert tc.name == nil
    assert tc.password == nil
  end
  test "create" do
    post "/users", params: {user: test_user_params}
    assert_equal test_user.name, Auth.decode(session['token'])['user']
    assert_redirected_to test_user
  end

  test "show" do
    post '/users', params: {user: test_user_params}
    follow_redirect!
    assert_response :success
    assert_equal "/users/#{test_user.id}", path
  end

  private

  def test_user
    users :one
  end

  def sign_in

  end

  def test_user_params
    { name: test_user.name, password: "test user password" }
  end

end
