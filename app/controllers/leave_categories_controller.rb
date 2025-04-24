class LeaveCategoriesController < ApplicationController
  before_action :set_leave_category, only: %i[ show edit update destroy ]
  before_action :set_organization, only: %i[ index new create]

  # GET /leave_categories or /leave_categories.json
  def index
    @leave_categories = LeaveCategory.all
  end

  # GET /leave_categories/1 or /leave_categories/1.json
  def show
  end

  # GET /leave_categories/new
  def new
    @leave_category = LeaveCategory.new
  end

  # GET /leave_categories/1/edit
  def edit
  end

  # POST /leave_categories or /leave_categories.json
  def create
    @leave_category = LeaveCategory.new(leave_category_params)
    @leave_category.organization = @organization

    respond_to do |format|
      if @leave_category.save
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Leave category was successfully created." }
        format.json { render :show, status: :created, location: @leave_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_categories/1 or /leave_categories/1.json
  def update
    respond_to do |format|
      if @leave_category.update(leave_category_params)
        format.html { redirect_to organization_hr_admin_path(@organization), notice: "Leave category was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_categories/1 or /leave_categories/1.json
  def destroy
    @leave_category.destroy!

    respond_to do |format|
      format.html { redirect_to leave_categories_path, status: :see_other, notice: "Leave category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_category
      @leave_category = LeaveCategory.find(params.expect(:id))
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Only allow a list of trusted parameters through.
    def leave_category_params
      params.expect(leave_category: [ :name, :organization_id ])
    end
end
