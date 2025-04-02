class OrgAssetsController < ApplicationController
  before_action :set_org_asset, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[index new create]

  # GET /org_assets or /org_assets.json
  def index
    assets = @employee.org_assets.map do |asset|
      {
        id: asset.id,
        name: asset.asset_name,
        category: asset.asset_category.name,
        serial_number: asset.asset_serial_number,
        assigned_on: asset.date_given,
        returned_on: asset.date_returned
      }
    end
    render inertia: "EmployeeAssets/Index", props: {
      assets:
    }
  end

  # GET /org_assets/1 or /org_assets/1.json
  def show
  end

  # GET /org_assets/new
  def new
    @org_asset = OrgAsset.new
  end

  # GET /org_assets/1/edit
  def edit
    @employee = @org_asset.employee
  end

  # POST /org_assets or /org_assets.json
  def create
    @org_asset = OrgAsset.new(org_asset_params)
    @org_asset.employee = @employee

    respond_to do |format|
      if @org_asset.save
        format.html { redirect_to @org_asset, notice: "Org asset was successfully created." }
        format.json { render :show, status: :created, location: @org_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @org_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /org_assets/1 or /org_assets/1.json
  def update
    respond_to do |format|
      if @org_asset.update(org_asset_params)
        format.html { redirect_to @org_asset, notice: "Org asset was successfully updated." }
        format.json { render :show, status: :ok, location: @org_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @org_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /org_assets/1 or /org_assets/1.json
  def destroy
    @org_asset.destroy!

    respond_to do |format|
      format.html { redirect_to org_assets_path, status: :see_other, notice: "Org asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_org_asset
      @org_asset = OrgAsset.find(params.expect(:id))
    end

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Only allow a list of trusted parameters through.
    def org_asset_params
      params.expect(org_asset: [ :employee_id, :asset_category_id, :date_given, :date_returned, :asset_name, :asset_serial_number ])
    end
end
