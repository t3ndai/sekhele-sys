require "test_helper"

class MyCareerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_career_index_url
    assert_response :success
  end
end
