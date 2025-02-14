class LeavePoliciesController < ApplicationController
  before_action :set_leave_policy, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create]

  # GET /leave_policies or /leave_policies.json
  def index
    @leave_policies = LeavePolicy.all
  end

  # GET /leave_policies/1 or /leave_policies/1.json
  def show
  end

  # GET /leave_policies/new
  def new
    @leave_policy = LeavePolicy.new
  end

  # GET /leave_policies/1/edit
  def edit
  end

  # POST /leave_policies or /leave_policies.json
  def create
    @leave_policy = LeavePolicy.new(leave_policy_params)
    @leave_policy.organization = @organization

    respond_to do |format|
      if @leave_policy.save
        format.html { redirect_to @leave_policy, notice: "Leave policy was successfully created." }
        format.json { render :show, status: :created, location: @leave_policy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_policies/1 or /leave_policies/1.json
  def update
    respond_to do |format|
      if @leave_policy.update(leave_policy_params)
        format.html { redirect_to @leave_policy, notice: "Leave policy was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_policy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_policies/1 or /leave_policies/1.json
  def destroy
    @leave_policy.destroy!

    respond_to do |format|
      format.html { redirect_to leave_policies_path, status: :see_other, notice: "Leave policy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_policy
      @leave_policy = LeavePolicy.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def leave_policy_params
      params.expect(leave_policy: [ :leave_category_id, :start_balance, :valid_from, :valid_to, :organization_id, :name ])
    end
end
