require "application_system_test_case"

class BenefitElectionsTest < ApplicationSystemTestCase
  setup do
    @benefit_election = benefit_elections(:one)
  end

  test "visiting the index" do
    visit benefit_elections_url
    assert_selector "h1", text: "Benefit elections"
  end

  test "should create benefit election" do
    visit benefit_elections_url
    click_on "New benefit election"

    fill_in "Benefit plan", with: @benefit_election.benefit_plan_id
    fill_in "Employee", with: @benefit_election.employee_id
    fill_in "Selected on", with: @benefit_election.selected_on
    click_on "Create Benefit election"

    assert_text "Benefit election was successfully created"
    click_on "Back"
  end

  test "should update Benefit election" do
    visit benefit_election_url(@benefit_election)
    click_on "Edit this benefit election", match: :first

    fill_in "Benefit plan", with: @benefit_election.benefit_plan_id
    fill_in "Employee", with: @benefit_election.employee_id
    fill_in "Selected on", with: @benefit_election.selected_on
    click_on "Update Benefit election"

    assert_text "Benefit election was successfully updated"
    click_on "Back"
  end

  test "should destroy Benefit election" do
    visit benefit_election_url(@benefit_election)
    click_on "Destroy this benefit election", match: :first

    assert_text "Benefit election was successfully destroyed"
  end
end
