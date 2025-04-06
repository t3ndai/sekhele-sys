class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ index new create ]

  # GET /goals or /goals.json
  def index
    goals = @employee.goals.map do |goal|
      {
        id: goal.id,
        name: goal.name,
        starts_on: goal.starts_on.strftime("%d-%b"),
        ends_on: goal.ends_on.strftime("%d-%b"),
        milestones: goal.milestones.map do |milestone|
          {
            id: milestone.id,
            name: milestone.name,
            completed_on: milestone.completed_on&.strftime("%d-%b"),
            started_on: milestone.started_on&.strftime("%d-%b"),
            description: milestone.description.body.to_plain_text
          }
        end
      }
    end

    render inertia: "Goals/Index", props: { goals: }
  end

  # GET /goals/1 or /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals or /goals.json
  def create
    @goal = Goal.new(goal_params)
    @goal.employee = @employee
    @goal.manager = @current_employee

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: "Goal was successfully created." }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1 or /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1 or /goals/1.json
  def destroy
    @goal.destroy!

    respond_to do |format|
      format.html { redirect_to goals_path, status: :see_other, notice: "Goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params.expect(:employee_id))
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.expect(goal: [ :employee_id, :manager_id, :name, :starts_on, :ends_on ])
    end
end
