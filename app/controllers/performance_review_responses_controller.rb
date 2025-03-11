class PerformanceReviewResponsesController < ApplicationController
  before_action :set_performance_review_response, only: %i[ show edit update destroy ]
  before_action :set_reviewer, only: %i[ index new create ]

  # GET /performance_review_responses or /performance_review_responses.json
  def index
    @performance_review_responses = PerformanceReviewResponse.all
  end

  # GET /performance_review_responses/1 or /performance_review_responses/1.json
  def show
  end

  # GET /performance_review_responses/new
  def new
    @performance_review_response = PerformanceReviewResponse.new
  end

  # GET /performance_review_responses/1/edit
  def edit
  end

  # POST /performance_review_responses or /performance_review_responses.json
  def create
    @performance_review_response = PerformanceReviewResponse.new(performance_review_response_params)

    respond_to do |format|
      if @performance_review_response.save
        format.html { redirect_to @performance_review_response, notice: "Performance review response was successfully created." }
        format.json { render :show, status: :created, location: @performance_review_response }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @performance_review_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performance_review_responses/1 or /performance_review_responses/1.json
  def update
    respond_to do |format|
      if @performance_review_response.update(performance_review_response_params)
        format.html { redirect_to @performance_review_response, notice: "Performance review response was successfully updated." }
        format.json { render :show, status: :ok, location: @performance_review_response }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @performance_review_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_review_responses/1 or /performance_review_responses/1.json
  def destroy
    @performance_review_response.destroy!

    respond_to do |format|
      format.html { redirect_to performance_review_responses_path, status: :see_other, notice: "Performance review response was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_review_response
      @performance_review_response = PerformanceReviewResponse.find(params.expect(:id))
    end

    def set_reviewer
      @reviewer = Employee.find(params.expect(:employee_id))
    end

    # Only allow a list of trusted parameters through.
    def performance_review_response_params
      params.expect(performance_review_response: [ :reviewer_id, :reviewee_id, :status, :response, :submitted_on, :performance_review_id ])
    end
end
