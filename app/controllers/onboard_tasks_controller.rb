class OnboardTasksController < ApplicationController
  before_action :set_onboard_task, only: %i[ show edit update destroy ]
  before_action :set_onboard_checklist, only: %i[new create]

  inertia_share flash: -> { flash.to_hash }

  # GET /onboard_tasks
  def index
    @onboard_tasks = OnboardTask.all
    render inertia: "OnboardTask/Index", props: {
      onboard_tasks: @onboard_tasks.map do |onboard_task|
        serialize_onboard_task(onboard_task)
      end
    }
  end

  # GET /onboard_tasks/1
  def show
    render inertia: "OnboardTask/Show", props: {
      onboard_task: serialize_onboard_task(@onboard_task)
    }
  end

  # GET /onboard_tasks/new
  def new
    @onboard_task = OnboardTask.new
    render inertia: "OnboardTask/New", props: {
      onboard_task: serialize_onboard_task(@onboard_task)
    }
  end

  # GET /onboard_tasks/1/edit
  def edit
    render inertia: "OnboardTask/Edit", props: {
      onboard_task: serialize_onboard_task(@onboard_task)
    }
  end

  # POST /onboard_tasks
  def create
    @onboard_task = OnboardTask.new(onboard_task_params)
    @onboard_task.onboard_checklist = @onboard_checklist

    if @onboard_task.save
      redirect_to @onboard_checklist, notice: "Onboard task was successfully created."
    else
      redirect_to new_onboard_task_url, inertia: { errors: @onboard_task.errors }
    end
  end

  # PATCH/PUT /onboard_tasks/1
  def update
    puts "onboard_task_params: #{onboard_task_params}"
    if @onboard_task.update(onboard_task_params)
      redirect_to @onboard_task.onboard_checklist, notice: "Onboard task was successfully updated."
    else
      redirect_to edit_onboard_task_url(@onboard_task), inertia: { errors: @onboard_task.errors }
    end
  end

  # DELETE /onboard_tasks/1
  def destroy
    @onboard_task.destroy!
    redirect_to onboard_tasks_url, notice: "Onboard task was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboard_task
      @onboard_task = OnboardTask.find(params[:id])
    end

    def set_onboard_checklist
      @onboard_checklist = OnboardChecklist.find(params[:onboard_checklist_id])
    end

    # Only allow a list of trusted parameters through.
    def onboard_task_params
      params.require(:onboard_task).permit(:name, :assignee_id, :tags, :due_on, :complete)
    end

    def serialize_onboard_task(onboard_task)
      onboard_task.as_json(only: [
        :id, :name, :assignee_id, :tags, :due_on, :complete
      ])
    end
end
