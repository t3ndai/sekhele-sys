require "application_system_test_case"

class InterviewStagesTest < ApplicationSystemTestCase
  setup do
    @interview_stage = interview_stages(:one)
  end

  test "visiting the index" do
    visit interview_stages_url
    assert_selector "h1", text: "Interview stages"
  end

  test "should create interview stage" do
    visit interview_stages_url
    click_on "New interview stage"

    fill_in "Mandatory", with: @interview_stage.mandatory
    fill_in "Name", with: @interview_stage.name
    fill_in "Organization", with: @interview_stage.organization_id
    click_on "Create Interview stage"

    assert_text "Interview stage was successfully created"
    click_on "Back"
  end

  test "should update Interview stage" do
    visit interview_stage_url(@interview_stage)
    click_on "Edit this interview stage", match: :first

    fill_in "Mandatory", with: @interview_stage.mandatory
    fill_in "Name", with: @interview_stage.name
    fill_in "Organization", with: @interview_stage.organization_id
    click_on "Update Interview stage"

    assert_text "Interview stage was successfully updated"
    click_on "Back"
  end

  test "should destroy Interview stage" do
    visit interview_stage_url(@interview_stage)
    click_on "Destroy this interview stage", match: :first

    assert_text "Interview stage was successfully destroyed"
  end
end
