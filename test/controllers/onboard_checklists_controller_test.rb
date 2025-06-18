require "test_helper"

class OnboardChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboard_checklist = onboard_checklists(:one)
  end

  test "should get index" do
    get onboard_checklists_url
    assert_response :success
  end

  test "should get new" do
    get new_onboard_checklist_url
    assert_response :success
  end

  test "should create onboard_checklist" do
    assert_difference("OnboardChecklist.count") do
      post onboard_checklists_url, params: { onboard_checklist: { name: @onboard_checklist.name, new_joiner_id: @onboard_checklist.new_joiner_id } }
    end

    assert_redirected_to onboard_checklist_url(OnboardChecklist.last)
  end

  test "should show onboard_checklist" do
    get onboard_checklist_url(@onboard_checklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_onboard_checklist_url(@onboard_checklist)
    assert_response :success
  end

  test "should update onboard_checklist" do
    patch onboard_checklist_url(@onboard_checklist), params: { onboard_checklist: { name: @onboard_checklist.name, new_joiner_id: @onboard_checklist.new_joiner_id } }
    assert_redirected_to onboard_checklist_url(@onboard_checklist)
  end

  test "should destroy onboard_checklist" do
    assert_difference("OnboardChecklist.count", -1) do
      delete onboard_checklist_url(@onboard_checklist)
    end

    assert_redirected_to onboard_checklists_url
  end
end
