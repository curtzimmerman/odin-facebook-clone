require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:test)
  end

  test "login with invalid information" do
  	get new_user_session_path
  	assert_template 'devise/sessions/new'
  	post user_session_path, 'user[email]': " ", 'user[password]': "  " 
  	assert_template 'devise/sessions/new'
  	assert_not flash.empty?
  	get new_user_session_path
  	assert flash.empty?
  end

  test "login with valid information followed by logout" do
  	get new_user_session_path
  	assert_template 'devise/sessions/new'
  	post user_session_path, user: { email: @user.email, password: 'foobar23' }
  	assert_redirected_to root_path
  	delete destroy_user_session_path
  	assert_redirected_to new_user_session_path
  end

end

