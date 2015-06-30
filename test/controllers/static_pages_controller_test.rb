require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "get root page" do
  	get :home
  	assert_response :success
  end
end
