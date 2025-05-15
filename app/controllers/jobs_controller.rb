class JobsController < ApplicationController
  before_action :set_organization, only: %i[ index show ]
  skip_before_action :authenticate

  inertia_share do
    {
      org_id: @organization.id
    }
  end

  def index
    job_postings = JobPosting.active.org_jobs(@organization).map do |job_posting|
    {
      id: job_posting.id,
      title: job_posting.title
    }
    end

    render inertia: "Jobs/Index", props: {job_postings: }
  end

  def show
    @job_posting = JobPosting.find(params[:job_posting_id])
    render inertia: "Jobs/Show", props: {
      job_posting: {
        id: @job_posting.id,
        title: @job_posting.title,
        date_close: @job_posting.date_close,
        description: @job_posting.description.body
      }
    }
  end

  private
  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
