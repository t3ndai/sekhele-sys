class PulseSurveysController < ApplicationController
  before_action :set_pulse_survey, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /pulse_surveys or /pulse_surveys.json
  def index
    @pulse_surveys = PulseSurvey.all
  end

  # GET /pulse_surveys/1 or /pulse_surveys/1.json
  def show
  end

  # GET /pulse_surveys/new
  def new
    @pulse_survey = PulseSurvey.new
  end

  # GET /pulse_surveys/1/edit
  def edit
  end

  # POST /pulse_surveys or /pulse_surveys.json
  def create
    @pulse_survey = PulseSurvey.new(pulse_survey_params)
    @pulse_survey.organization = @organization

    respond_to do |format|
      if @pulse_survey.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Pulse survey was successfully created." }
        format.json { render :show, status: :created, location: @pulse_survey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pulse_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pulse_surveys/1 or /pulse_surveys/1.json
  def update
    respond_to do |format|
      if @pulse_survey.update(pulse_survey_params)
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Pulse survey was successfully updated." }
        format.json { render :show, status: :ok, location: @pulse_survey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pulse_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulse_surveys/1 or /pulse_surveys/1.json
  def destroy
    @pulse_survey.destroy!

    respond_to do |format|
      format.html { redirect_to pulse_surveys_path, status: :see_other, notice: "Pulse survey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pulse_survey
      @pulse_survey = PulseSurvey.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params.expect(:organization_id))
    end

    # Only allow a list of trusted parameters through.
    def pulse_survey_params
      params.expect(pulse_survey: [ :date_open, :date_close, :name, :organization_id ])
    end
end
