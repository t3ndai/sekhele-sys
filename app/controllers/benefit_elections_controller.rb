class BenefitElectionsController < ApplicationController
  before_action :set_benefit_election, only: %i[ show edit update destroy ]

  # GET /benefit_elections or /benefit_elections.json
  def index
    @benefit_elections = BenefitElection.all
  end

  # GET /benefit_elections/1 or /benefit_elections/1.json
  def show
  end

  # GET /benefit_elections/new
  def new
    @benefit_election = BenefitElection.new
  end

  # GET /benefit_elections/1/edit
  def edit
  end

  # POST /benefit_elections or /benefit_elections.json
  def create
    @benefit_election = BenefitElection.new(benefit_election_params)

    respond_to do |format|
      if @benefit_election.save
        format.html { redirect_to @benefit_election, notice: "Benefit election was successfully created." }
        format.json { render :show, status: :created, location: @benefit_election }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @benefit_election.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefit_elections/1 or /benefit_elections/1.json
  def update
    respond_to do |format|
      if @benefit_election.update(benefit_election_params)
        format.html { redirect_to @benefit_election, notice: "Benefit election was successfully updated." }
        format.json { render :show, status: :ok, location: @benefit_election }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @benefit_election.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefit_elections/1 or /benefit_elections/1.json
  def destroy
    @benefit_election.destroy!

    respond_to do |format|
      format.html { redirect_to benefit_elections_path, status: :see_other, notice: "Benefit election was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit_election
      @benefit_election = BenefitElection.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def benefit_election_params
      params.expect(benefit_election: [ :employee_id, :benefit_plan_id, :selected_on, documents: [] ])
    end
end
