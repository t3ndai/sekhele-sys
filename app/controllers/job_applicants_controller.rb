class JobApplicantsController < ApplicationController
  before_action :set_job_applicant, only: %i[ show edit update destroy ]
  before_action :set_job_posting, only: %i[ new create ]

  # GET /job_applicants or /job_applicants.json
  def index
    @job_applicants = JobApplicant.all
  end

  # GET /job_applicants/1 or /job_applicants/1.json
  def show
  end

  # GET /job_applicants/new
  def new
    @job_applicant = JobApplicant.new
  end

  # GET /job_applicants/1/edit
  def edit
  end

  # POST /job_applicants or /job_applicants.json
  def create
    @job_applicant = JobApplicant.new(job_applicant_params)
    @job_applicant.applied_on = Date.current
    @job_applicant.job_posting = @job_posting

    respond_to do |format|
      if @job_applicant.save
        format.html { redirect_to organization_job_path(@job_posting), notice: "Job application submitted succesfully" }
        format.json { render :show, status: :created, location: @job_applicant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_applicants/1 or /job_applicants/1.json
  def update
    respond_to do |format|
      if @job_applicant.update(job_applicant_params)
        format.html { redirect_to @job_applicant, notice: "Job applicant was successfully updated." }
        format.json { render :show, status: :ok, location: @job_applicant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applicants/1 or /job_applicants/1.json
  def destroy
    @job_applicant.destroy!

    respond_to do |format|
      format.html { redirect_to job_applicants_path, status: :see_other, notice: "Job applicant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_applicant
      @job_applicant = JobApplicant.find(params.expect(:id))
    end

    def set_job_posting
      @job_posting = JobPosting.find(params.expect(:job_posting_id))
    end

    # Only allow a list of trusted parameters through.
    def job_applicant_params
      params.expect(job_applicant: [ :job_posting_id, :applied_on, :first_name, :last_name, :middle_name, :email, :phone, :cv, other_docs: [] ])
    end
end
