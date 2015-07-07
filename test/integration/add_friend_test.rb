require 'test_helper'

class AddFriendTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:test)
  	@friend = users(:test2)
  end

  test "should add friend correctly" do
  	get new_user_session_path
  	post user_session_path, user: { email: @user.email, password: 'foobar23' }
    assert_redirected_to root_path
  	get user_path(@friend.id)
  	assert_template 'users/show'
    assert_difference('FriendRequest.count') do
      post friend_requests_path, friend_request: { recipient_id: @friend.id, sender_id: @user.id }
    end
    delete destroy_user_session_path
    assert_redirected_to new_user_session_path
    post user_session_path, user: { email: @friend.email, password: 'foobar23' }
    assert_redirected_to root_path
    get user_path(@friend.id)
    assert_match @user.name && @user.email, response.body
    assert_difference(['@user.friends.count', '@friend.friends.count']) do
      post friendships_path, friendship: { friend_request_id: @user.sent_friend_requests.last.id }
    end
    delete destroy_user_session_path
    assert_redirected_to new_user_session_path
  end
end
