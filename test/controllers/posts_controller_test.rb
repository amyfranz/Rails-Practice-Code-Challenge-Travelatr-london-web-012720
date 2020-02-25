require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get like" do
    get posts_like_url
    assert_response :success
  end

end
