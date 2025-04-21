class BenefitTypesController < ApplicationController
  before_action :set_benefit_type, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create ]

  # GET /benefit_types or /benefit_types.json
  def index
    @benefit_types = BenefitType.all
  end

  # GET /benefit_types/1 or /benefit_types/1.json
  def show
  end

  # GET /benefit_types/new
  def new
    @benefit_type = BenefitType.new
  end

  # GET /benefit_types/1/edit
  def edit
  end

  # POST /benefit_types or /benefit_types.json
  def create
    @benefit_type = BenefitType.new(benefit_type_params)
    @benefit_type.organization = @organization

    respond_to do |format|
      if @benefit_type.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Benefit type was successfully created." }
        format.json { render :show, status: :created, location: @benefit_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @benefit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefit_types/1 or /benefit_types/1.json
  def update
    respond_to do |format|
      if @benefit_type.update(benefit_type_params)
        format.html { redirect_to @benefit_type, notice: "Benefit type was successfully updated." }
        format.json { render :show, status: :ok, location: @benefit_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @benefit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefit_types/1 or /benefit_types/1.json
  def destroy
    @benefit_type.destroy!

    respond_to do |format|
      format.html { redirect_to benefit_types_path, status: :see_other, notice: "Benefit type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit_type
      @benefit_type = BenefitType.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def benefit_type_params
      params.expect(benefit_type: [ :name, :organization_id ])
    end
end
