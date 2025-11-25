require "test_helper"

class BlocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blocs_index_url
    assert_response :success
  end

  test "should get show" do
    get blocs_show_url
    assert_response :success
  end
end
