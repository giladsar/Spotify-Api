require 'test_helper'

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get responses_fetch_url
    assert_response :success
  end

end
