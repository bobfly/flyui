require "test_helper"

class DummiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dummies_index_url
    assert_response :success
  end
end
