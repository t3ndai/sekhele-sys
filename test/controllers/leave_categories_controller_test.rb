require "test_helper"

class LeaveCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_category = leave_categories(:one)
  end

  test "should get index" do
    get leave_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_category_url
    assert_response :success
  end

  test "should create leave_category" do
    assert_difference("LeaveCategory.count") do
      post leave_categories_url, params: { leave_category: { name: @leave_category.name, organization_id: @leave_category.organization_id } }
    end

    assert_redirected_to leave_category_url(LeaveCategory.last)
  end

  test "should show leave_category" do
    get leave_category_url(@leave_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_category_url(@leave_category)
    assert_response :success
  end

  test "should update leave_category" do
    patch leave_category_url(@leave_category), params: { leave_category: { name: @leave_category.name, organization_id: @leave_category.organization_id } }
    assert_redirected_to leave_category_url(@leave_category)
  end

  test "should destroy leave_category" do
    assert_difference("LeaveCategory.count", -1) do
      delete leave_category_url(@leave_category)
    end

    assert_redirected_to leave_categories_url
  end
end
