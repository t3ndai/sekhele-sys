class JobsController < ApplicationController
  before_action :set_organization, only: %i[ index show ]
  skip_before_action :authenticate

  def index
    @job_postings = JobPosting.active.org_jobs(@organization)
  end

  def show
    @job_posting = JobPosting.find(params[:job_posting_id])
  end

  private
  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
