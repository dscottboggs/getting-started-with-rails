require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user creation" do
    new_user = User.new name: 'david', password: '', password_confirmation: "won't match"
    assert_not new_user.save
    new_user.password = 'the correct password'
    assert_not new_user.save
    new_user.password_confirmation = 'the correct password'
    assert new_user.save
    assert_not new_user.authenticate 'incorrect password'
    assert new_user.authenticate 'the correct password'
    assert_not User.find_by(name: 'david').try :authenticate, 'incorrect password'
    assert User.find_by(name: 'david').try :authenticate, 'the correct password'
  end
end
