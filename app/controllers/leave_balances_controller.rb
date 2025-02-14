class LeaveBalancesController < ApplicationController
  before_action :set_leave_balance, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[index new create]

  # GET /leave_balances or /leave_balances.json
  def index
    @leave_balances = LeaveBalance.all
  end

  # GET /leave_balances/1 or /leave_balances/1.json
  def show
  end

  # GET /leave_balances/new
  def new
    @leave_balance = LeaveBalance.new
  end

  # GET /leave_balances/1/edit
  def edit
  end

  # POST /leave_balances or /leave_balances.json
  def create
    @leave_balance = LeaveBalance.new(leave_balance_params)
    @leave_balance.employee = @employee

    respond_to do |format|
      if @leave_balance.save
        format.html { redirect_to @leave_balance, notice: "Leave balance was successfully created." }
        format.json { render :show, status: :created, location: @leave_balance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_balances/1 or /leave_balances/1.json
  def update
    respond_to do |format|
      if @leave_balance.update(leave_balance_params)
        format.html { redirect_to @leave_balance, notice: "Leave balance was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_balance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_balances/1 or /leave_balances/1.json
  def destroy
    @leave_balance.destroy!

    respond_to do |format|
      format.html { redirect_to leave_balances_path, status: :see_other, notice: "Leave balance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_balance
      @leave_balance = LeaveBalance.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def leave_balance_params
      params.expect(leave_balance: [ :employee_id, :leave_policy_id, :time_taken ])
    end
end
