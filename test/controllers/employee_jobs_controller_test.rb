require "test_helper"

class EmployeeJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_job = employee_jobs(:one)
  end

  test "should get index" do
    get employee_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_job_url
    assert_response :success
  end

  test "should create employee_job" do
    assert_difference("EmployeeJob.count") do
      post employee_jobs_url, params: { employee_job: { employee_id: @employee_job.employee_id, ended_on: @employee_job.ended_on, job_function_id: @employee_job.job_function_id, job_level_id: @employee_job.job_level_id, started_on: @employee_job.started_on } }
    end

    assert_redirected_to employee_job_url(EmployeeJob.last)
  end

  test "should show employee_job" do
    get employee_job_url(@employee_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_job_url(@employee_job)
    assert_response :success
  end

  test "should update employee_job" do
    patch employee_job_url(@employee_job), params: { employee_job: { employee_id: @employee_job.employee_id, ended_on: @employee_job.ended_on, job_function_id: @employee_job.job_function_id, job_level_id: @employee_job.job_level_id, started_on: @employee_job.started_on } }
    assert_redirected_to employee_job_url(@employee_job)
  end

  test "should destroy employee_job" do
    assert_difference("EmployeeJob.count", -1) do
      delete employee_job_url(@employee_job)
    end

    assert_redirected_to employee_jobs_url
  end
end
