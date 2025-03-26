class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  # before_action :set_assignee, only: %i[ index new create ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.assigned_by = @current_employee
    assignee_id = params.dig(:assignee, :id)
    @assignee = Employee.find(assignee_id)
    @task.assignee = @assignee

    respond_to do |format|
      if @task.save
        format.html { redirect_to employee_employee_dashboard_show_path(@current_employee), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to employee_employee_dashboard_show_path(@current_employee), status: :ok, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    def set_assignee
      @assignee = Employee.find(params.expect(:employee_id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :title, :assigned_by_id, :assignee, :due_on, :status, :notes, files: [] ])
    end
end
