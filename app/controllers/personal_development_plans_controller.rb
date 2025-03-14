class PersonalDevelopmentPlansController < ApplicationController
  before_action :set_personal_development_plan, only: %i[ show edit update destroy ]

  # GET /personal_development_plans or /personal_development_plans.json
  def index
    @personal_development_plans = PersonalDevelopmentPlan.all
  end

  # GET /personal_development_plans/1 or /personal_development_plans/1.json
  def show
  end

  # GET /personal_development_plans/new
  def new
    @personal_development_plan = PersonalDevelopmentPlan.new
  end

  # GET /personal_development_plans/1/edit
  def edit
  end

  # POST /personal_development_plans or /personal_development_plans.json
  def create
    @personal_development_plan = PersonalDevelopmentPlan.new(personal_development_plan_params)

    respond_to do |format|
      if @personal_development_plan.save
        format.html { redirect_to @personal_development_plan, notice: "Personal development plan was successfully created." }
        format.json { render :show, status: :created, location: @personal_development_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_development_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_development_plans/1 or /personal_development_plans/1.json
  def update
    respond_to do |format|
      if @personal_development_plan.update(personal_development_plan_params)
        format.html { redirect_to @personal_development_plan, notice: "Personal development plan was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_development_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_development_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_development_plans/1 or /personal_development_plans/1.json
  def destroy
    @personal_development_plan.destroy!

    respond_to do |format|
      format.html { redirect_to personal_development_plans_path, status: :see_other, notice: "Personal development plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_development_plan
      @personal_development_plan = PersonalDevelopmentPlan.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def personal_development_plan_params
      params.expect(personal_development_plan: [ :employee_id, :name ])
    end
end
