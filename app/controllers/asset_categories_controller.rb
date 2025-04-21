class AssetCategoriesController < ApplicationController
  before_action :set_asset_category, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[index new create]

  # GET /asset_categories or /asset_categories.json
  def index
    @asset_categories = AssetCategory.all
  end

  # GET /asset_categories/1 or /asset_categories/1.json
  def show
  end

  # GET /asset_categories/new
  def new
    @asset_category = AssetCategory.new
  end

  # GET /asset_categories/1/edit
  def edit
  end

  # POST /asset_categories or /asset_categories.json
  def create
    @asset_category = AssetCategory.new(asset_category_params)
    @asset_category.organization = @organization

    respond_to do |format|
      if @asset_category.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Asset category was successfully created." }
        format.json { render :show, status: :created, location: @asset_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asset_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_categories/1 or /asset_categories/1.json
  def update
    respond_to do |format|
      if @asset_category.update(asset_category_params)
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Asset category was successfully updated." }
        format.json { render :show, status: :ok, location: @asset_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asset_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_categories/1 or /asset_categories/1.json
  def destroy
    @asset_category.destroy!

    respond_to do |format|
      format.html { redirect_to asset_categories_path, status: :see_other, notice: "Asset category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_category
      @asset_category = AssetCategory.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def asset_category_params
      params.expect(asset_category: [ :name, :organization_id ])
    end
end
