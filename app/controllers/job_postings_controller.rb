class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /job_postings or /job_postings.json
  def index
    @job_postings = JobPosting.all
  end

  # GET /job_postings/1 or /job_postings/1.json
  def show
    render inertia: "Recruitment/ShowJob", props: { job_posting: serialize_job_posting(@job_posting) }
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings or /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)
    @job_posting.organization = @organization

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to @job_posting, notice: "Job posting was successfully created." }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1 or /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to @job_posting, notice: "Job posting was successfully updated." }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1 or /job_postings/1.json
  def destroy
    @job_posting.destroy!

    respond_to do |format|
      format.html { redirect_to job_postings_path, status: :see_other, notice: "Job posting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params.expect(:organization_id))
    end

    # Only allow a list of trusted parameters through.
    def job_posting_params
      params.expect(job_posting: [ :organization_id, :num_positions, :date_open, :date_close, :description, :title ])
    end

    def serialize_job_posting(job_posting)
      job_posting.as_json(only: [ :id, :title, :date_open, :date_close, :num_positions ]).merge({ description: job_posting.description.body })
    end
end
