require "test_helper"

class LeavePoliciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_policy = leave_policies(:one)
  end

  test "should get index" do
    get leave_policies_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_policy_url
    assert_response :success
  end

  test "should create leave_policy" do
    assert_difference("LeavePolicy.count") do
      post leave_policies_url, params: { leave_policy: { balance_expires: @leave_policy.balance_expires, balance_starts: @leave_policy.balance_starts, leave_category_id: @leave_policy.leave_category_id, name: @leave_policy.name, organization_id: @leave_policy.organization_id, start_balance: @leave_policy.start_balance } }
    end

    assert_redirected_to leave_policy_url(LeavePolicy.last)
  end

  test "should show leave_policy" do
    get leave_policy_url(@leave_policy)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_policy_url(@leave_policy)
    assert_response :success
  end

  test "should update leave_policy" do
    patch leave_policy_url(@leave_policy), params: { leave_policy: { balance_expires: @leave_policy.balance_expires, balance_starts: @leave_policy.balance_starts, leave_category_id: @leave_policy.leave_category_id, name: @leave_policy.name, organization_id: @leave_policy.organization_id, start_balance: @leave_policy.start_balance } }
    assert_redirected_to leave_policy_url(@leave_policy)
  end

  test "should destroy leave_policy" do
    assert_difference("LeavePolicy.count", -1) do
      delete leave_policy_url(@leave_policy)
    end

    assert_redirected_to leave_policies_url
  end
end
