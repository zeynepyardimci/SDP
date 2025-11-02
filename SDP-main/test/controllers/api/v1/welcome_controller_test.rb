require "test_helper"

class Api::V1::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_welcome_index_url
    assert_response :success
  end
end
