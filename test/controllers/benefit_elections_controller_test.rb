require "test_helper"

class BenefitElectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @benefit_election = benefit_elections(:one)
  end

  test "should get index" do
    get benefit_elections_url
    assert_response :success
  end

  test "should get new" do
    get new_benefit_election_url
    assert_response :success
  end

  test "should create benefit_election" do
    assert_difference("BenefitElection.count") do
      post benefit_elections_url, params: { benefit_election: { benefit_plan_id: @benefit_election.benefit_plan_id, employee_id: @benefit_election.employee_id, selected_on: @benefit_election.selected_on } }
    end

    assert_redirected_to benefit_election_url(BenefitElection.last)
  end

  test "should show benefit_election" do
    get benefit_election_url(@benefit_election)
    assert_response :success
  end

  test "should get edit" do
    get edit_benefit_election_url(@benefit_election)
    assert_response :success
  end

  test "should update benefit_election" do
    patch benefit_election_url(@benefit_election), params: { benefit_election: { benefit_plan_id: @benefit_election.benefit_plan_id, employee_id: @benefit_election.employee_id, selected_on: @benefit_election.selected_on } }
    assert_redirected_to benefit_election_url(@benefit_election)
  end

  test "should destroy benefit_election" do
    assert_difference("BenefitElection.count", -1) do
      delete benefit_election_url(@benefit_election)
    end

    assert_redirected_to benefit_elections_url
  end
end
