require 'test_helper'

class ReturnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get returns_index_url
    assert_response :success
  end

end
