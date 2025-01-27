class CostCentersController < ApplicationController
  before_action :set_cost_center, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /cost_centers or /cost_centers.json
  def index
    @cost_centers = CostCenter.all
  end

  # GET /cost_centers/1 or /cost_centers/1.json
  def show
  end

  # GET /cost_centers/new
  def new
    @cost_center = CostCenter.new
  end

  # GET /cost_centers/1/edit
  def edit
  end

  # POST /cost_centers or /cost_centers.json
  def create
    @cost_center = CostCenter.new(cost_center_params)
    @cost_center.organization = @organization

    respond_to do |format|
      if @cost_center.save
        format.html { redirect_to @cost_center, notice: "Cost center was successfully created." }
        format.json { render :show, status: :created, location: @cost_center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cost_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_centers/1 or /cost_centers/1.json
  def update
    respond_to do |format|
      if @cost_center.update(cost_center_params)
        format.html { redirect_to @cost_center, notice: "Cost center was successfully updated." }
        format.json { render :show, status: :ok, location: @cost_center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cost_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_centers/1 or /cost_centers/1.json
  def destroy
    @cost_center.destroy!

    respond_to do |format|
      format.html { redirect_to cost_centers_path, status: :see_other, notice: "Cost center was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost_center
      @cost_center = CostCenter.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def cost_center_params
      params.expect(cost_center: [ :name, :description, :code ])
    end
end
