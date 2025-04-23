class JobFunctionsController < ApplicationController
  before_action :set_job_function, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /job_functions or /job_functions.json
  def index
    @job_functions = JobFunction.all
  end

  # GET /job_functions/1 or /job_functions/1.json
  def show
  end

  # GET /job_functions/new
  def new
    @job_function = JobFunction.new
  end

  # GET /job_functions/1/edit
  def edit
  end

  # POST /job_functions or /job_functions.json
  def create
    min_salary = job_function_params[:salary_range_min].to_f
    max_salary = job_function_params[:salary_range_max].to_f
    job_function_opts = {
      title: job_function_params[:title],
      salary_range: (min_salary..max_salary)
    }
    @job_function = JobFunction.new(job_function_opts)
    @job_function.organization = @organization
    department = Department.find(job_function_params[:department_id])
    @job_function.department = department

    respond_to do |format|
      if @job_function.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Job function was successfully created." }
        format.json { render :show, status: :created, location: @job_function }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_functions/1 or /job_functions/1.json
  def update
    respond_to do |format|
      if @job_function.update(job_function_params)
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Job function was successfully updated." }
        format.json { render :show, status: :ok, location: @job_function }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_functions/1 or /job_functions/1.json
  def destroy
    @job_function.destroy!

    respond_to do |format|
      format.html { redirect_to job_functions_path, status: :see_other, notice: "Job function was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_function
      @job_function = JobFunction.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def job_function_params
      params.expect(job_function: [ :title, :department_id, :salary_range_min, :salary_range_max ])
    end
end
