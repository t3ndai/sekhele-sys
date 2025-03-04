require "test_helper"

class MilestonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milestone = milestones(:one)
  end

  test "should get index" do
    get milestones_url
    assert_response :success
  end

  test "should get new" do
    get new_milestone_url
    assert_response :success
  end

  test "should create milestone" do
    assert_difference("Milestone.count") do
      post milestones_url, params: { milestone: { completed_on: @milestone.completed_on, description: @milestone.description, goal_id: @milestone.goal_id, name: @milestone.name, started_on: @milestone.started_on } }
    end

    assert_redirected_to milestone_url(Milestone.last)
  end

  test "should show milestone" do
    get milestone_url(@milestone)
    assert_response :success
  end

  test "should get edit" do
    get edit_milestone_url(@milestone)
    assert_response :success
  end

  test "should update milestone" do
    patch milestone_url(@milestone), params: { milestone: { completed_on: @milestone.completed_on, description: @milestone.description, goal_id: @milestone.goal_id, name: @milestone.name, started_on: @milestone.started_on } }
    assert_redirected_to milestone_url(@milestone)
  end

  test "should destroy milestone" do
    assert_difference("Milestone.count", -1) do
      delete milestone_url(@milestone)
    end

    assert_redirected_to milestones_url
  end
end
