require "test_helper"

class OnboardTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboard_task = onboard_tasks(:one)
  end

  test "should get index" do
    get onboard_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_onboard_task_url
    assert_response :success
  end

  test "should create onboard_task" do
    assert_difference("OnboardTask.count") do
      post onboard_tasks_url, params: { onboard_task: { assignee_id: @onboard_task.assignee_id, due_on: @onboard_task.due_on, name: @onboard_task.name, tags: @onboard_task.tags } }
    end

    assert_redirected_to onboard_task_url(OnboardTask.last)
  end

  test "should show onboard_task" do
    get onboard_task_url(@onboard_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_onboard_task_url(@onboard_task)
    assert_response :success
  end

  test "should update onboard_task" do
    patch onboard_task_url(@onboard_task), params: { onboard_task: { assignee_id: @onboard_task.assignee_id, due_on: @onboard_task.due_on, name: @onboard_task.name, tags: @onboard_task.tags } }
    assert_redirected_to onboard_task_url(@onboard_task)
  end

  test "should destroy onboard_task" do
    assert_difference("OnboardTask.count", -1) do
      delete onboard_task_url(@onboard_task)
    end

    assert_redirected_to onboard_tasks_url
  end
end
