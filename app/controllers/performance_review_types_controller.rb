class PerformanceReviewTypesController < ApplicationController
  before_action :set_performance_review_type, only: %i[ show edit update destroy ]

  # GET /performance_review_types or /performance_review_types.json
  def index
    @performance_review_types = PerformanceReviewType.all
  end

  # GET /performance_review_types/1 or /performance_review_types/1.json
  def show
  end

  # GET /performance_review_types/new
  def new
    @performance_review_type = PerformanceReviewType.new
  end

  # GET /performance_review_types/1/edit
  def edit
  end

  # POST /performance_review_types or /performance_review_types.json
  def create
    @performance_review_type = PerformanceReviewType.new(performance_review_type_params)

    respond_to do |format|
      if @performance_review_type.save
        format.html { redirect_to @performance_review_type, notice: "Performance review type was successfully created." }
        format.json { render :show, status: :created, location: @performance_review_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @performance_review_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performance_review_types/1 or /performance_review_types/1.json
  def update
    respond_to do |format|
      if @performance_review_type.update(performance_review_type_params)
        format.html { redirect_to @performance_review_type, notice: "Performance review type was successfully updated." }
        format.json { render :show, status: :ok, location: @performance_review_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @performance_review_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_review_types/1 or /performance_review_types/1.json
  def destroy
    @performance_review_type.destroy!

    respond_to do |format|
      format.html { redirect_to performance_review_types_path, status: :see_other, notice: "Performance review type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_review_type
      @performance_review_type = PerformanceReviewType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def performance_review_type_params
      params.expect(performance_review_type: [ :name ])
    end
end
