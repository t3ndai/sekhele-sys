require "test_helper"

class TimeWorkedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_worked = time_workeds(:one)
  end

  test "should get index" do
    get time_workeds_url
    assert_response :success
  end

  test "should get new" do
    get new_time_worked_url
    assert_response :success
  end

  test "should create time_worked" do
    assert_difference("TimeWorked.count") do
      post time_workeds_url, params: { time_worked: { day: @time_worked.day, employee_id: @time_worked.employee_id, end_time: @time_worked.end_time, note: @time_worked.note, start_time: @time_worked.start_time } }
    end

    assert_redirected_to time_worked_url(TimeWorked.last)
  end

  test "should show time_worked" do
    get time_worked_url(@time_worked)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_worked_url(@time_worked)
    assert_response :success
  end

  test "should update time_worked" do
    patch time_worked_url(@time_worked), params: { time_worked: { day: @time_worked.day, employee_id: @time_worked.employee_id, end_time: @time_worked.end_time, note: @time_worked.note, start_time: @time_worked.start_time } }
    assert_redirected_to time_worked_url(@time_worked)
  end

  test "should destroy time_worked" do
    assert_difference("TimeWorked.count", -1) do
      delete time_worked_url(@time_worked)
    end

    assert_redirected_to time_workeds_url
  end
end
