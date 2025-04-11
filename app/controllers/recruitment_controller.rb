class RecruitmentController < ApplicationController
  before_action :set_candidate, only: %i[candidate]
  def index
    listed_jobs = @current_employee.organization.job_postings.map do |job_posting|
      {
        id: job_posting.id,
        title: job_posting.title,
        num_positions: job_posting.num_positions,
        date_open: job_posting.date_open.strftime("%Y-%b-%d"),
        date_close: job_posting.date_close.strftime("%Y-%b-%d"),
        created: job_posting.created_at.strftime("%Y-%b-%d")

      }
    end

    job_applicants = @current_employee.organization.job_applicants.map do |job_applicant|
      {
        id: job_applicant.id,
        name: job_applicant.full_name,
        position: job_applicant.job_posting.title,
        applied_on: job_applicant.applied_on

      }
    end

    interviews = @current_employee.organization.interviews.map do |interview|
      {
        id: interview.id,
        stage: interview.interview_stage.name,
        candidate: interview.job_applicant.full_name,
        interview_on: interview.interview_on.strftime("%e %b %Y"),
        interview_at: interview.interview_at.strftime("%l:%M %p")
      }
    end
    render inertia: "Recruitment/Index", props: { listed_jobs:, job_applicants:, interviews: }
  end

  def newjob
    @job_posting = JobPosting.new
    render inertia: "Recruitment/NewJobPosting", props: { job_posting: serialize_job_posting(@job_posting) }
  end

  def candidate
    render inertia: "Recruitment/Candidate" if @candidate.is_org_candidate?(@current_employee)
  end

  private
  def serialize_job_posting(job_posting)
    job_posting.as_json(only: [ :id, :title, :date_open, :date_close, :description ])
  end

  def set_candidate
    @candidate = JobApplicant.find(params[:candidate_id])
  end
end
