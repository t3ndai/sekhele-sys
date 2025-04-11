require "test_helper"

class HrAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hr_admin_index_url
    assert_response :success
  end
end
