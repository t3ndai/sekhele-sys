class TimeWorkedsController < ApplicationController
  before_action :set_time_worked, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ index new create ]

  # GET /time_workeds or /time_workeds.json
  def index
    @time_workeds = TimeWorked.all
  end

  # GET /time_workeds/1 or /time_workeds/1.json
  def show
  end

  # GET /time_workeds/new
  def new
    @time_worked = TimeWorked.new
  end

  # GET /time_workeds/1/edit
  def edit
  end

  # POST /time_workeds or /time_workeds.json
  def create
    @time_worked = TimeWorked.new(time_worked_params)
    @time_worked.employee = @employee

    respond_to do |format|
      if @time_worked.save
        format.html { redirect_to @time_worked, notice: "Time worked was successfully created." }
        format.json { render :show, status: :created, location: @time_worked }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_worked.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_workeds/1 or /time_workeds/1.json
  def update
    respond_to do |format|
      if @time_worked.update(time_worked_params)
        format.html { redirect_to @time_worked, notice: "Time worked was successfully updated." }
        format.json { render :show, status: :ok, location: @time_worked }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_worked.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_workeds/1 or /time_workeds/1.json
  def destroy
    @time_worked.destroy!

    respond_to do |format|
      format.html { redirect_to time_workeds_path, status: :see_other, notice: "Time worked was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_worked
      @time_worked = TimeWorked.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def time_worked_params
      params.expect(time_worked: [ :start_time, :end_time, :note, :day, :employee_id ])
    end
end
