class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[ show edit update destroy ]
  before_action :set_job_applicant, only: %i[ index new create ]

  # GET /interviews or /interviews.json
  def index
    @interviews = Interview.all
  end

  # GET /interviews/1 or /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews or /interviews.json
  def create
    @interview = Interview.new(interview_params)
    @interview.job_applicant = @job_applicant

    respond_to do |format|
      if @interview.save
        format.html { redirect_to employee_recruitment_candidate_path(@current_employee, @job_applicant), notice: "Interview was successfully created." }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1 or /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: "Interview was successfully updated." }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1 or /interviews/1.json
  def destroy
    @interview.destroy!

    respond_to do |format|
      format.html { redirect_to interviews_path, status: :see_other, notice: "Interview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params.expect(:id))
    end

    def set_job_applicant
      @job_applicant = JobApplicant.find(params.expect(:job_applicant_id))
    end

    # Only allow a list of trusted parameters through.
    def interview_params
      params.expect(interview: [ :interview_stage_id, :interview_on, :interview_at, :meeting_link, :room, :location, :job_applicant_id, :note ])
    end
end
