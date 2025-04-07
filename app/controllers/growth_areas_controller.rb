class GrowthAreasController < ApplicationController
  before_action :set_growth_area, only: %i[ show edit update destroy ]

  # GET /growth_areas or /growth_areas.json
  def index
    @growth_areas = GrowthArea.all
  end

  # GET /growth_areas/1 or /growth_areas/1.json
  def show
  end

  # GET /growth_areas/new
  def new
    @growth_area = GrowthArea.new
  end

  # GET /growth_areas/1/edit
  def edit
  end

  # POST /growth_areas or /growth_areas.json
  def create
    @growth_area = GrowthArea.new(growth_area_params)
    @growth_area.employee = @current_employee

    respond_to do |format|
      if @growth_area.save
        format.html { redirect_to employee_my_career_path(@current_employee), notice: "Growth area was successfully created." }
        format.json { render :show, status: :created, location: @growth_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @growth_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growth_areas/1 or /growth_areas/1.json
  def update
    respond_to do |format|
      if @growth_area.update(growth_area_params)
        format.html { redirect_to @growth_area, notice: "Growth area was successfully updated." }
        format.json { render :show, status: :ok, location: @growth_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @growth_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growth_areas/1 or /growth_areas/1.json
  def destroy
    @growth_area.destroy!

    respond_to do |format|
      format.html { redirect_to growth_areas_path, status: :see_other, notice: "Growth area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growth_area
      @growth_area = GrowthArea.find(params.expect(:id))
    end

    def set_personal_development_plan
      @personal_development_plan = PersonalDevelopmentPlan.find(params.expect(:personal_development_plan_id))
    end

    # Only allow a list of trusted parameters through.
    def growth_area_params
      params.expect(growth_area: [ :personal_development_plan_id, :name, :description ])
    end
end
