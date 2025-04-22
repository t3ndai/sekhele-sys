class AssetsController < ApplicationController
  before_action :set_asset, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ new create  ]

  inertia_share flash: -> { flash.to_hash }

  # GET /assets
  def index
    @assets = Asset.all
    render inertia: "Asset/Index", props: {
      assets: @assets.map do |asset|
        serialize_asset(asset)
      end
    }
  end

  # GET /assets/1
  def show
    render inertia: "Asset/Show", props: {
      asset: serialize_asset(@asset)
    }
  end

  # GET /assets/new
  def new
    @asset = Asset.new
    render inertia: "Asset/New", props: {
      asset: serialize_asset(@asset)
    }
  end

  # GET /assets/1/edit
  def edit
    render inertia: "Asset/Edit", props: {
      asset: serialize_asset(@asset)
    }
  end

  # POST /assets
  def create
    @asset = Asset.new(asset_params)
    @asset.organization = @organization

    if @asset.save
      redirect_to organization_hr_admin_path(@organization), notice: "Asset was successfully created."
    else
      redirect_to new_asset_url, inertia: { errors: @asset.errors }
    end
  end

  # PATCH/PUT /assets/1
  def update
    if @asset.update(asset_params)
      redirect_to @asset, notice: "Asset was successfully updated."
    else
      redirect_to edit_asset_url(@asset), inertia: { errors: @asset.errors }
    end
  end

  # DELETE /assets/1
  def destroy
    @asset.destroy!
    redirect_to assets_url, notice: "Asset was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_params
      params.require(:asset).permit(:organization_id, :asset_category_id, :name, :serial_number, :status)
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    def serialize_asset(asset)
      asset.as_json(only: [
        :id, :organization_id, :asset_category_id, :name, :serial_number, :status
      ])
    end
end
