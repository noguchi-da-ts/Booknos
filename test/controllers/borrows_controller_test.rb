require 'test_helper'

class BorrowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get borrows_index_url
    assert_response :success
  end

end
