class TalentsController < ApplicationController
  before_action :set_talent, only: %i[ show edit update destroy ]

  # GET /talents or /talents.json
  def index
    @talents = Talent.all
  end

  # GET /talents/1 or /talents/1.json
  def show
  end

  # GET /talents/new
  def new
    @talent = Talent.new
  end

  # GET /talents/1/edit
  def edit
  end

  # POST /talents or /talents.json
  def create
    @talent = Talent.new(talent_params)

    respond_to do |format|
      if @talent.save
        format.html { redirect_to @talent, notice: "Talent was successfully created." }
        format.json { render :show, status: :created, location: @talent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talents/1 or /talents/1.json
  def update
    respond_to do |format|
      if @talent.update(talent_params)
        format.html { redirect_to @talent, notice: "Talent was successfully updated." }
        format.json { render :show, status: :ok, location: @talent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talents/1 or /talents/1.json
  def destroy
    @talent.destroy!

    respond_to do |format|
      format.html { redirect_to talents_path, status: :see_other, notice: "Talent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = Talent.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def talent_params
      params.expect(talent: [ :personal_development_plan_id, :name, :description ])
    end
end
