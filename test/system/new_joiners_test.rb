require "application_system_test_case"

class NewJoinersTest < ApplicationSystemTestCase
  setup do
    @new_joiner = new_joiners(:one)
  end

  test "visiting the index" do
    visit new_joiners_url
    assert_selector "h1", text: "New joiners"
  end

  test "should create new joiner" do
    visit new_joiners_url
    click_on "New new joiner"

    fill_in "Job applicant", with: @new_joiner.job_applicant_id
    fill_in "Manager", with: @new_joiner.manager_id
    fill_in "Start date", with: @new_joiner.start_date
    click_on "Create New joiner"

    assert_text "New joiner was successfully created"
    click_on "Back"
  end

  test "should update New joiner" do
    visit new_joiner_url(@new_joiner)
    click_on "Edit this new joiner", match: :first

    fill_in "Job applicant", with: @new_joiner.job_applicant_id
    fill_in "Manager", with: @new_joiner.manager_id
    fill_in "Start date", with: @new_joiner.start_date
    click_on "Update New joiner"

    assert_text "New joiner was successfully updated"
    click_on "Back"
  end

  test "should destroy New joiner" do
    visit new_joiner_url(@new_joiner)
    click_on "Destroy this new joiner", match: :first

    assert_text "New joiner was successfully destroyed"
  end
end
