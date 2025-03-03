class CandidateNotesController < ApplicationController
  before_action :set_candidate_note, only: %i[ show edit update destroy ]
  before_action :set_job_applicant, only: %i[ index new create ]

  # GET /candidate_notes or /candidate_notes.json
  def index
    @candidate_notes = @job_applicant.candidate_notes.all
  end

  # GET /candidate_notes/1 or /candidate_notes/1.json
  def show
  end

  # GET /candidate_notes/new
  def new
    @candidate_note = CandidateNote.new
  end

  # GET /candidate_notes/1/edit
  def edit
  end

  # POST /candidate_notes or /candidate_notes.json
  def create
    @candidate_note = CandidateNote.new(candidate_note_params)
    @candidate_note.job_applicant = @job_applicant
    @candidate_note.employee = @current_employee

    respond_to do |format|
      if @candidate_note.save
        format.html { redirect_to @job_applicant, notice: "Candidate note was successfully created." }
        format.json { render :show, status: :created, location: @candidate_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_notes/1 or /candidate_notes/1.json
  def update
    respond_to do |format|
      if @candidate_note.update(candidate_note_params)
        format.html { redirect_to @candidate_note, notice: "Candidate note was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_notes/1 or /candidate_notes/1.json
  def destroy
    @candidate_note.destroy!

    respond_to do |format|
      format.html { redirect_to candidate_notes_path, status: :see_other, notice: "Candidate note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_note
      @candidate_note = CandidateNote.find(params.expect(:id))
    end

    def set_job_applicant
      @job_applicant = JobApplicant.find(params.expect(:job_applicant_id))
    end

    # Only allow a list of trusted parameters through.
    def candidate_note_params
      params.expect(candidate_note: [ :job_applicant_id, :employee_id, :note ])
    end
end
