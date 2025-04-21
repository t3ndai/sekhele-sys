class BenefitPlansController < ApplicationController
  before_action :set_benefit_plan, only: %i[ show edit update destroy ]
  before_action :set_benefit, only: %i[ index new create ]

  # GET /benefit_plans or /benefit_plans.json
  def index
    @benefit_plans = @benefit.benefit_plans.all
  end

  # GET /benefit_plans/1 or /benefit_plans/1.json
  def show
  end

  # GET /benefit_plans/new
  def new
    @benefit_plan = BenefitPlan.new
  end

  # GET /benefit_plans/1/edit
  def edit
  end

  # POST /benefit_plans or /benefit_plans.json
  def create
    @benefit_plan = BenefitPlan.new(benefit_plan_params)
    @benefit_plan.benefit = @benefit

    respond_to do |format|
      if @benefit_plan.save
        format.html { redirect_to benefit_path(@benefit), notice: "Benefit plan was successfully created." }
        format.json { render :show, status: :created, location: @benefit_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @benefit_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefit_plans/1 or /benefit_plans/1.json
  def update
    respond_to do |format|
      if @benefit_plan.update(benefit_plan_params)
        format.html { redirect_to @benefit_plan, notice: "Benefit plan was successfully updated." }
        format.json { render :show, status: :ok, location: @benefit_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @benefit_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefit_plans/1 or /benefit_plans/1.json
  def destroy
    @benefit_plan.destroy!

    respond_to do |format|
      format.html { redirect_to benefit_plans_path, status: :see_other, notice: "Benefit plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit_plan
      @benefit_plan = BenefitPlan.find(params.expect(:id))
    end

    def set_benefit
      @benefit = Benefit.find(params.expect(:benefit_id))
    end

    # Only allow a list of trusted parameters through.
    def benefit_plan_params
      params.expect(benefit_plan: [ :benefit_id, :name, :employer_contribution, :employee_contribution, :cover, documents: [] ])
    end
end
