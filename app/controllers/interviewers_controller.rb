class InterviewersController < ApplicationController
  before_action :set_interviewer, only: %i[ show edit update destroy ]
  before_action :set_interview, only: %i[ index new create ]


  # GET /interviewers or /interviewers.json
  def index
    @interviewers = Interviewer.all
  end

  # GET /interviewers/1 or /interviewers/1.json
  def show
  end

  # GET /interviewers/new
  def new
    @interviewer = Interviewer.new
  end

  # GET /interviewers/1/edit
  def edit
  end

  # POST /interviewers or /interviewers.json
  def create
    @interviewer = Interviewer.new(interviewer_params)
    @interviewer.interview = @interview
    @interviewer.assigned_on = Date.current

    respond_to do |format|
      if @interviewer.save
        format.html { redirect_to @interviewer, notice: "Interviewer was successfully created." }
        format.json { render :show, status: :created, location: @interviewer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviewers/1 or /interviewers/1.json
  def update
    respond_to do |format|
      if @interviewer.update(interviewer_params)
        format.html { redirect_to @interviewer, notice: "Interviewer was successfully updated." }
        format.json { render :show, status: :ok, location: @interviewer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviewers/1 or /interviewers/1.json
  def destroy
    @interviewer.destroy!

    respond_to do |format|
      format.html { redirect_to interviewers_path, status: :see_other, notice: "Interviewer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interviewer
      @interviewer = Interviewer.find(params.expect(:id))
    end

    def set_interview
      @interview = Interview.find(params.expect(:interview_id))
    end

    # Only allow a list of trusted parameters through.
    def interviewer_params
      params.expect(interviewer: [ :interview_id, :employee_id, :assigned_on ])
    end
end
