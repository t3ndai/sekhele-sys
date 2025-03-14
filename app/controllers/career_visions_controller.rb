class CareerVisionsController < ApplicationController
  before_action :set_career_vision, only: %i[ show edit update destroy ]

  # GET /career_visions or /career_visions.json
  def index
    @career_visions = CareerVision.all
  end

  # GET /career_visions/1 or /career_visions/1.json
  def show
  end

  # GET /career_visions/new
  def new
    @career_vision = CareerVision.new
  end

  # GET /career_visions/1/edit
  def edit
  end

  # POST /career_visions or /career_visions.json
  def create
    @career_vision = CareerVision.new(career_vision_params)

    respond_to do |format|
      if @career_vision.save
        format.html { redirect_to @career_vision, notice: "Career vision was successfully created." }
        format.json { render :show, status: :created, location: @career_vision }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @career_vision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /career_visions/1 or /career_visions/1.json
  def update
    respond_to do |format|
      if @career_vision.update(career_vision_params)
        format.html { redirect_to @career_vision, notice: "Career vision was successfully updated." }
        format.json { render :show, status: :ok, location: @career_vision }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @career_vision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /career_visions/1 or /career_visions/1.json
  def destroy
    @career_vision.destroy!

    respond_to do |format|
      format.html { redirect_to career_visions_path, status: :see_other, notice: "Career vision was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career_vision
      @career_vision = CareerVision.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def career_vision_params
      params.expect(career_vision: [ :personal_development_plan_id, :name, :description ])
    end
end
