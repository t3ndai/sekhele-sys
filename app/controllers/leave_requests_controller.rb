class LeaveRequestsController < ApplicationController
  before_action :set_leave_request, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[index new create]

  # GET /leave_requests or /leave_requests.json
  def index
    @leave_requests = LeaveRequest.all
  end

  # GET /leave_requests/1 or /leave_requests/1.json
  def show
  end

  # GET /leave_requests/new
  def new
    @leave_request = LeaveRequest.new
  end

  # GET /leave_requests/1/edit
  def edit
  end

  # POST /leave_requests or /leave_requests.json
  def create
    @leave_request = LeaveRequest.new(leave_request_params)
    @leave_request.employee = @employee
    leave_policy_id = params.dig(:leave_policy,:id)
    leave_policy = LeavePolicy.find(leave_policy_id)
    @leave_request.leave_policy = leave_policy

    respond_to do |format|
      if @leave_request.save
        format.html { redirect_to @leave_request, notice: "Leave request was successfully created." }
        format.json { render :show, status: :created, location: @leave_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_requests/1 or /leave_requests/1.json
  def update
    respond_to do |format|
      if @leave_request.update(leave_request_params)
        format.html { redirect_to @leave_request, notice: "Leave request was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_requests/1 or /leave_requests/1.json
  def destroy
    @leave_request.destroy!

    respond_to do |format|
      format.html { redirect_to leave_requests_path, status: :see_other, notice: "Leave request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_request
      @leave_request = LeaveRequest.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def leave_request_params
      params.expect(leave_request: [ :employee_id, :leave_policy_id,  :status, :approver_id, :date_from, :date_to, :reason ])
    end
end
