require "test_helper"

class CloudinaryTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cloudinary_test_index_url
    assert_response :success
  end
end
