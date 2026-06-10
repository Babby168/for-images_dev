require "test_helper"

class CssMosaicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get css_mosaic_index_url
    assert_response :success
  end
end
