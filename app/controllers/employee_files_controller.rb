class EmployeeFilesController < ApplicationController
  before_action :set_employee_file, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[index new create]

  # GET /employee_files or /employee_files.json
  def index
    @employee_files = EmployeeFile.all
  end

  # GET /employee_files/1 or /employee_files/1.json
  def show
  end

  # GET /employee_files/new
  def new
    @employee_file = EmployeeFile.new
  end

  # GET /employee_files/1/edit
  def edit
  end

  # POST /employee_files or /employee_files.json
  def create
    @employee_file = EmployeeFile.new(employee_file_params)
    @employee_file.employee = @employee

    respond_to do |format|
      if @employee_file.save
        format.html { redirect_to @employee_file, notice: "Employee file was successfully created." }
        format.json { render :show, status: :created, location: @employee_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_files/1 or /employee_files/1.json
  def update
    respond_to do |format|
      if @employee_file.update(employee_file_params)
        format.html { redirect_to @employee_file, notice: "Employee file was successfully updated." }
        format.json { render :show, status: :ok, location: @employee_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_files/1 or /employee_files/1.json
  def destroy
    @employee_file.destroy!

    respond_to do |format|
      format.html { redirect_to employee_files_path, status: :see_other, notice: "Employee file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_file
      @employee_file = EmployeeFile.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def employee_file_params
      params.expect(employee_file: [ :file, :document_id ])
    end
end
