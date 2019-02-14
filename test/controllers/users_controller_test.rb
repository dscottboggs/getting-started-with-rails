require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "new" do
    tc = UsersController.new.new
    assert tc.name == nil
    assert tc.password == nil
  end
  test "create" do
    post "/users", params: test_user_params
    assert session['token']
  end

  test "show" do
    tc = UsersController.new
    # This doesn't work: #session is delegated to @_request
    # in controllers, which is nil in Unit tests: Must use
    # integration tests
    # 
    # tc.session[:token] = test_user.session_token
    # user = tc.show
    # assert test_user.name == user.name
  end

  private

  def test_user
    users :one
  end

  def test_user_params
    { name: test_user.name, password: "test user password" }
  end

end
