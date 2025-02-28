require "test_helper"

class JobApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_applicant = job_applicants(:one)
  end

  test "should get index" do
    get job_applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_job_applicant_url
    assert_response :success
  end

  test "should create job_applicant" do
    assert_difference("JobApplicant.count") do
      post job_applicants_url, params: { job_applicant: { applied_on: @job_applicant.applied_on, email: @job_applicant.email, first_name: @job_applicant.first_name, job_posting_id: @job_applicant.job_posting_id, last_name: @job_applicant.last_name, middle_name: @job_applicant.middle_name, phone: @job_applicant.phone } }
    end

    assert_redirected_to job_applicant_url(JobApplicant.last)
  end

  test "should show job_applicant" do
    get job_applicant_url(@job_applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_applicant_url(@job_applicant)
    assert_response :success
  end

  test "should update job_applicant" do
    patch job_applicant_url(@job_applicant), params: { job_applicant: { applied_on: @job_applicant.applied_on, email: @job_applicant.email, first_name: @job_applicant.first_name, job_posting_id: @job_applicant.job_posting_id, last_name: @job_applicant.last_name, middle_name: @job_applicant.middle_name, phone: @job_applicant.phone } }
    assert_redirected_to job_applicant_url(@job_applicant)
  end

  test "should destroy job_applicant" do
    assert_difference("JobApplicant.count", -1) do
      delete job_applicant_url(@job_applicant)
    end

    assert_redirected_to job_applicants_url
  end
end
