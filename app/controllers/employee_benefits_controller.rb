class EmployeeBenefitsController < ApplicationController
  before_action :set_employee
  def index
    @employee_benefits = Benefit.org_benefits(@employee.organization_id).map do |benefit|
      {
        id: benefit.id,
        name: benefit.name,
        type: benefit.benefit_type.name.humanize,
        valuation_type: benefit.valuation_type.humanize
      }
    end
    render inertia: 'EmployeeBenefits/Index', props: {
      employee_benefits: @employee_benefits
    }
  end

  def show_benefit
    @benefit = Benefit.find(params[:benefit_id])
    @benefit_plans = @benefit.benefit_plans.map do |benefit_plan|
      {
        id: benefit_plan.id,
        name: benefit_plan.name,
        employee_contribution: benefit_plan.employee_contribution,
        cover: benefit_plan.cover.humanize,
        documents: benefit_plan.documents.map do |document|
          {
            id: document.id,
            name: document.filename,
            url: rails_blob_url(document, only_path: true)
          }
        end
      }
    end
    render inertia: 'EmployeeBenefits/Show', props: {
      benefit: @benefit,
      benefit_plans: @benefit_plans
    }
  end

  def show_benefit_plans
    @benefit = Benefit.find(params[:benefit_id])
    @benefit_plans = @benefit.benefit_plans
  end

  def show_benefit_plan
    @benefit_plan = BenefitPlan.find(params[:benefit_plan_id])
  end

  def elect_benefit_plan
    @benefit_election = BenefitElection.new
    @benefit_plan = BenefitPlan.find(params[:benefit_plan_id])
    @benefit_election.employee_id = @employee.id
    @benefit_election.benefit_plan_id = @benefit_plan.id
    if @benefit_election.save
      redirect_to employee_benefits_path(@employee), flash: { notice: 'Benefit Plan was successfully elected.' }

    else
      render :show_benefit_plan, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end
