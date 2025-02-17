require "test_helper"

class LeaveRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_request = leave_requests(:one)
  end

  test "should get index" do
    get leave_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_request_url
    assert_response :success
  end

  test "should create leave_request" do
    assert_difference("LeaveRequest.count") do
      post leave_requests_url, params: { leave_request: { approver_id: @leave_request.approver_id, date_from: @leave_request.date_from, date_to: @leave_request.date_to, employee_id: @leave_request.employee_id, status: @leave_request.status } }
    end

    assert_redirected_to leave_request_url(LeaveRequest.last)
  end

  test "should show leave_request" do
    get leave_request_url(@leave_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_request_url(@leave_request)
    assert_response :success
  end

  test "should update leave_request" do
    patch leave_request_url(@leave_request), params: { leave_request: { approver_id: @leave_request.approver_id, date_from: @leave_request.date_from, date_to: @leave_request.date_to, employee_id: @leave_request.employee_id, status: @leave_request.status } }
    assert_redirected_to leave_request_url(@leave_request)
  end

  test "should destroy leave_request" do
    assert_difference("LeaveRequest.count", -1) do
      delete leave_request_url(@leave_request)
    end

    assert_redirected_to leave_requests_url
  end
end
