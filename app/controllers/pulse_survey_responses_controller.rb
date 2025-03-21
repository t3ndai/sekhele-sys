class PulseSurveyResponsesController < ApplicationController
  before_action :set_pulse_survey_response, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[index]

  # GET /pulse_survey_responses or /pulse_survey_responses.json
  def index
    @pulse_survey_responses = PulseSurveyResponse.all
  end

  # GET /pulse_survey_responses/1 or /pulse_survey_responses/1.json
  def show
  end

  # GET /pulse_survey_responses/new
  def new
    @pulse_survey_response = PulseSurveyResponse.new
  end

  # GET /pulse_survey_responses/1/edit
  def edit
  end

  # POST /pulse_survey_responses or /pulse_survey_responses.json
  def create
    @pulse_survey_response = PulseSurveyResponse.new(pulse_survey_response_params)

    respond_to do |format|
      if @pulse_survey_response.save
        format.html { redirect_to @pulse_survey_response, notice: "Pulse survey response was successfully created." }
        format.json { render :show, status: :created, location: @pulse_survey_response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pulse_survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pulse_survey_responses/1 or /pulse_survey_responses/1.json
  def update
    respond_to do |format|
      if @pulse_survey_response.update(pulse_survey_response_params.merge(submitted_on: Time.now))
        format.html { redirect_to @pulse_survey_response, notice: "Pulse survey response was successfully submitted" }
        format.json { render :show, status: :ok, location: @pulse_survey_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pulse_survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulse_survey_responses/1 or /pulse_survey_responses/1.json
  def destroy
    @pulse_survey_response.destroy!

    respond_to do |format|
      format.html { redirect_to pulse_survey_responses_path, status: :see_other, notice: "Pulse survey response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pulse_survey_response
      @pulse_survey_response = PulseSurveyResponse.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params.expect(:employee_id))
    end

    # Only allow a list of trusted parameters through.
    def pulse_survey_response_params
      params.expect(pulse_survey_response: [ :pulse_survey_id, :responder_id, :annon_id, :submitted_on, pulse_survey_answer_attributes: [ :sentiment, :answer ] ])
    end
end
