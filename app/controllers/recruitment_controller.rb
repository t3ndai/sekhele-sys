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
    candidate = {
      id: @candidate.id,
      name: @candidate.full_name,
      applied_on: @candidate.applied_on.strftime("%e %b %Y"),
      phone: @candidate.phone,
      email: @candidate.email,
      position: @candidate.job_posting.title,
      notes: @candidate.candidate_notes.map do |note|
        {
          note: note.note,
          by: note.employee.full_name
        }
      end,
      interviews: @candidate.interviews.map do |interview|
        {
          id: interview.id,
          interview_on: interview.interview_on.strftime("%e %b %Y"),
          interview_at: interview.interview_at.strftime("%l:%M %p"),
          feedbacks: interview.interview_feedbacks.map do |feedback|
            {
              id: feedback.id,
              notes: feedback.notes.to_s,
              status: feedback.status.humanize
            }
          end,
          interviewers: interview.interviewers.map do |interviewer|
            {
              name: interviewer.employee.full_name
            }
          end
        }
      end,
      cv: rails_blob_url(@candidate.cv, only_path: true),
      status: @candidate.candidate_status&.status&.humanize,
      offer_details: {
        reason_file: (rails_blob_url(@candidate.candidate_status&.reason_doc, only_path: true) if @candidate.candidate_status&.reason_doc&.attached?),
        offer_on: @candidate.candidate_status&.created_at&.strftime("%e %b %Y"),
        offer_by: @candidate.candidate_status&.status_by_name
      },
      to_onboard: @candidate.candidate_status.offer_accepted? && !@candidate.new_joiner.present?,
      is_onboarding: @candidate.new_joiner.present?,
      new_joiner: @candidate.new_joiner.present? ? {
        id: @candidate.new_joiner.id
      } : nil
    }
    interview_stages = @current_employee.organization.interview_stages.map do |interview_stage|
      {
        id: interview_stage.id,
        name: interview_stage.name.humanize
      }
    end
    feedback_statuses = InterviewFeedback.statuses.keys.map do |status|
      {
        name: status.humanize,
        value: status.to_s
      }
    end
    employees = current_employee.organization.employees
    employees = employees.map do |employee|
      { name: employee.full_name, id: employee.id }
    end
    render inertia: "Recruitment/Candidate", props: { candidate:, interview_stages:, employees:, feedback_statuses:  } if @candidate.is_org_candidate?(@current_employee)
  end

  private
  def serialize_job_posting(job_posting)
    job_posting.as_json(only: [ :id, :title, :date_open, :date_close, :description ])
  end

  def set_candidate
    @candidate = JobApplicant.find(params[:candidate_id])
  end
end
