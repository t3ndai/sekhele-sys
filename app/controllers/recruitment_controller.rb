class RecruitmentController < ApplicationController
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
    render inertia: "Recruitment/Index", props: { listed_jobs: }
  end
end
