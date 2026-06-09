require "test_helper"

class SidekiqTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sidekiq_test_index_url
    assert_response :success
  end
end
