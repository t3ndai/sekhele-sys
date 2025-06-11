require "test_helper"

class NewJoinersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_joiner = new_joiners(:one)
  end

  test "should get index" do
    get new_joiners_url
    assert_response :success
  end

  test "should get new" do
    get new_new_joiner_url
    assert_response :success
  end

  test "should create new_joiner" do
    assert_difference("NewJoiner.count") do
      post new_joiners_url, params: { new_joiner: { job_applicant_id: @new_joiner.job_applicant_id, manager_id: @new_joiner.manager_id, start_date: @new_joiner.start_date } }
    end

    assert_redirected_to new_joiner_url(NewJoiner.last)
  end

  test "should show new_joiner" do
    get new_joiner_url(@new_joiner)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_joiner_url(@new_joiner)
    assert_response :success
  end

  test "should update new_joiner" do
    patch new_joiner_url(@new_joiner), params: { new_joiner: { job_applicant_id: @new_joiner.job_applicant_id, manager_id: @new_joiner.manager_id, start_date: @new_joiner.start_date } }
    assert_redirected_to new_joiner_url(@new_joiner)
  end

  test "should destroy new_joiner" do
    assert_difference("NewJoiner.count", -1) do
      delete new_joiner_url(@new_joiner)
    end

    assert_redirected_to new_joiners_url
  end
end
