class BenefitsController < ApplicationController
  before_action :set_benefit, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /benefits or /benefits.json
  def index
    @benefits = Benefit.all
  end

  # GET /benefits/1 or /benefits/1.json
  def show
    # TODO: Show Benefit details to user of same organization as Benefit

    benefit = {
      id: @benefit.id,
      type: @benefit.benefit_type.name.humanize,
      name: @benefit.name,
      valuation_type: @benefit.valuation_type.humanize

    }
    benefit_plans = @benefit.benefit_plans.map do |plan|
      {
        id: plan.id,
        name: plan.name,
        employee_contribution: plan.employee_contribution,
        employer_contribution: plan.employer_contribution,
        cover: plan.cover.humanize
      }
    end
    cover_types = BenefitPlan.covers.keys.map do |cover_type|
      {
        name: cover_type.humanize,
        value: cover_type.to_s
      }
    end

    render inertia: "HrAdmin/ShowBenefit", props: { benefit:, benefit_plans:, cover_types: }
  end

  # GET /benefits/new
  def new
    @benefit = Benefit.new
  end

  # GET /benefits/1/edit
  def edit
  end

  # POST /benefits or /benefits.json
  def create
    @benefit = Benefit.new(benefit_params)
    @benefit.organization = @organization

    respond_to do |format|
      if @benefit.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Benefit was successfully created." }
        format.json { render :show, status: :created, location: @benefit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefits/1 or /benefits/1.json
  def update
    respond_to do |format|
      if @benefit.update(benefit_params)
        format.html { redirect_to @benefit, notice: "Benefit was successfully updated." }
        format.json { render :show, status: :ok, location: @benefit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefits/1 or /benefits/1.json
  def destroy
    @benefit.destroy!

    respond_to do |format|
      format.html { redirect_to benefits_path, status: :see_other, notice: "Benefit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit
      @benefit = Benefit.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params.expect(:organization_id))
    end

    # Only allow a list of trusted parameters through.
    def benefit_params
      params.expect(benefit: [ :organization_id, :benefit_type_id, :name, :valuation_type ])
    end
end
