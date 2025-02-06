class EmployeeManagersController < ApplicationController
  before_action :set_employee_manager, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[new create]

  # GET /employee_managers/1 or /employee_managers/1.json
  def show
  end

  # GET /employee_managers/new
  def new
    @employee_manager = @employee.build_manager
    @managers = Employee.same_organization(@employee.organization)
  end

  # GET /employee_managers/1/edit
  def edit
  end

  # POST /employee_managers or /employee_managers.json
  def create
    @employee_manager = Employee.find(params[:selected_manager])
    @employee.manager = @employee_manager

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee manager was successfully assigned." }
        format.json { render :show, status: :created, location: @employee_manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_managers/1 or /employee_managers/1.json
  def update
    respond_to do |format|
      if @employee_manager.update(employee_manager_params)
        format.html { redirect_to @employee_manager, notice: "Employee manager was successfully updated." }
        format.json { render :show, status: :ok, location: @employee_manager }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_managers/1 or /employee_managers/1.json
  def destroy
    @employee_manager.destroy!

    respond_to do |format|
      format.html { redirect_to employee_managers_path, status: :see_other, notice: "Employee manager was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_manager
      @employee_manager = EmployeeManager.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def employee_manager_params
      params.fetch(:employee_manager, {}).permit(:selected_manager)
    end
end
