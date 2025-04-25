class InterviewStagesController < ApplicationController
  before_action :set_interview_stage, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /interview_stages or /interview_stages.json
  def index
    @interview_stages = @organization.interview_stages.all
  end

  # GET /interview_stages/1 or /interview_stages/1.json
  def show
  end

  # GET /interview_stages/new
  def new
    @interview_stage = InterviewStage.new
  end

  # GET /interview_stages/1/edit
  def edit
  end

  # POST /interview_stages or /interview_stages.json
  def create
    @interview_stage = InterviewStage.new(interview_stage_params)
    @interview_stage.organization = @organization

    respond_to do |format|
      if @interview_stage.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Interview stage was successfully created." }
        format.json { render :show, status: :created, location: @interview_stage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_stages/1 or /interview_stages/1.json
  def update
    respond_to do |format|
      if @interview_stage.update(interview_stage_params)
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Interview stage was successfully updated." }
        format.json { render :show, status: :ok, location: @interview_stage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview_stage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_stages/1 or /interview_stages/1.json
  def destroy
    @interview_stage.destroy!

    respond_to do |format|
      format.html { redirect_to interview_stages_path, status: :see_other, notice: "Interview stage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_stage
      @interview_stage = InterviewStage.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params.expect(:organization_id))
    end

    # Only allow a list of trusted parameters through.
    def interview_stage_params
      params.expect(interview_stage: [ :organization_id, :name, :mandatory, :stage_type ])
    end
end
