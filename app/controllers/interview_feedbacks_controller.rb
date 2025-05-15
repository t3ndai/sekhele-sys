class InterviewFeedbacksController < ApplicationController
  before_action :set_interview_feedback, only: %i[ show edit update destroy ]
  before_action :set_interview, only: %i[ index new create ]

  # GET /interview_feedbacks or /interview_feedbacks.json
  def index
    @interview_feedbacks = InterviewFeedback.all
  end

  # GET /interview_feedbacks/1 or /interview_feedbacks/1.json
  def show
  end

  # GET /interview_feedbacks/new
  def new
    @interview_feedback = InterviewFeedback.new
  end

  # GET /interview_feedbacks/1/edit
  def edit
  end

  # POST /interview_feedbacks or /interview_feedbacks.json
  def create
    @interview_feedback = InterviewFeedback.new(interview_feedback_params)
    @interview_feedback.interview = @interview
    @employee = Employee.find_by(user: Current.user)
    @interviewer = Interviewer.find_by(employee: @employee, interview: @interview)
    @interview_feedback.interviewer = @interviewer
    @job_applicant = @interview.job_applicant

    respond_to do |format|
      if @interview_feedback.save
        format.html { redirect_to employee_recruitment_candidate_path(@current_employee, @job_applicant), notice: "Interview feedback was successfully created." }
        format.json { render :show, status: :created, location: @interview_feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_feedbacks/1 or /interview_feedbacks/1.json
  def update
    respond_to do |format|
      if @interview_feedback.update(interview_feedback_params)
        format.html { redirect_to @interview_feedback, notice: "Interview feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @interview_feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_feedbacks/1 or /interview_feedbacks/1.json
  def destroy
    @interview_feedback.destroy!

    respond_to do |format|
      format.html { redirect_to interview_feedbacks_path, status: :see_other, notice: "Interview feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_feedback
      @interview_feedback = InterviewFeedback.find(params.expect(:id))
    end

    def set_interview
      @interview = Interview.find(params.expect(:interview_id))
    end

    # Only allow a list of trusted parameters through.
    def interview_feedback_params
      params.expect(interview_feedback: [ :interview_id, :interviewer_id, :notes, :status ])
    end
end
