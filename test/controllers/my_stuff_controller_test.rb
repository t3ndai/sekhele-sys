require "test_helper"

class MyStuffControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_stuff_index_url
    assert_response :success
  end
end
