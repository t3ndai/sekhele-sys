class PerformanceReviewQuestionsController < ApplicationController
  before_action :set_performance_review_question, only: %i[ show edit update destroy ]

  # GET /performance_review_questions or /performance_review_questions.json
  def index
    @performance_review_questions = PerformanceReviewQuestion.all
  end

  # GET /performance_review_questions/1 or /performance_review_questions/1.json
  def show
  end

  # GET /performance_review_questions/new
  def new
    @performance_review_question = PerformanceReviewQuestion.new
  end

  # GET /performance_review_questions/1/edit
  def edit
  end

  # POST /performance_review_questions or /performance_review_questions.json
  def create
    @performance_review_question = PerformanceReviewQuestion.new(performance_review_question_params)

    respond_to do |format|
      if @performance_review_question.save
        format.html { redirect_to @performance_review_question, notice: "Performance review question was successfully created." }
        format.json { render :show, status: :created, location: @performance_review_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @performance_review_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performance_review_questions/1 or /performance_review_questions/1.json
  def update
    respond_to do |format|
      if @performance_review_question.update(performance_review_question_params)
        format.html { redirect_to @performance_review_question, notice: "Performance review question was successfully updated." }
        format.json { render :show, status: :ok, location: @performance_review_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @performance_review_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performance_review_questions/1 or /performance_review_questions/1.json
  def destroy
    @performance_review_question.destroy!

    respond_to do |format|
      format.html { redirect_to performance_review_questions_path, status: :see_other, notice: "Performance review question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance_review_question
      @performance_review_question = PerformanceReviewQuestion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def performance_review_question_params
      params.expect(performance_review_question: [ :performance_review_type_id, :title ])
    end
end
