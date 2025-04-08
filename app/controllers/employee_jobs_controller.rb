class EmployeeJobsController < ApplicationController
  before_action :set_employee_job, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /employee_jobs
  def index
    @employee_jobs = EmployeeJob.all
    render inertia: 'EmployeeJob/Index', props: {
      employee_jobs: @employee_jobs.map do |employee_job|
        serialize_employee_job(employee_job)
      end
    }
  end

  # GET /employee_jobs/1
  def show
    render inertia: 'EmployeeJob/Show', props: {
      employee_job: serialize_employee_job(@employee_job)
    }
  end

  # GET /employee_jobs/new
  def new
    @employee_job = EmployeeJob.new
    render inertia: 'EmployeeJob/New', props: {
      employee_job: serialize_employee_job(@employee_job)
    }
  end

  # GET /employee_jobs/1/edit
  def edit
    render inertia: 'EmployeeJob/Edit', props: {
      employee_job: serialize_employee_job(@employee_job)
    }
  end

  # POST /employee_jobs
  def create
    @employee_job = EmployeeJob.new(employee_job_params)

    if @employee_job.save
      redirect_to @employee_job, notice: "Employee job was successfully created."
    else
      redirect_to new_employee_job_url, inertia: { errors: @employee_job.errors }
    end
  end

  # PATCH/PUT /employee_jobs/1
  def update
    if @employee_job.update(employee_job_params)
      redirect_to @employee_job, notice: "Employee job was successfully updated."
    else
      redirect_to edit_employee_job_url(@employee_job), inertia: { errors: @employee_job.errors }
    end
  end

  # DELETE /employee_jobs/1
  def destroy
    @employee_job.destroy!
    redirect_to employee_jobs_url, notice: "Employee job was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_job
      @employee_job = EmployeeJob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_job_params
      params.require(:employee_job).permit(:job_function_id, :employee_id, :job_level_id, :started_on, :ended_on)
    end

    def serialize_employee_job(employee_job)
      employee_job.as_json(only: [
        :id, :job_function_id, :employee_id, :job_level_id, :started_on, :ended_on
      ])
    end
end
