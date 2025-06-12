class JobApplicantsController < ApplicationController
  before_action :set_job_applicant, only: %i[ show edit update destroy ]
  before_action :set_job_posting, only: %i[ new create ]
  skip_before_action :authenticate, only: %i[ offer_acceptance ]

  inertia_share flash: -> { flash.to_hash }

  # GET /job_applicants or /job_applicants.json
  def index
    @job_applicants = JobApplicant.all
  end

  # GET /job_applicants/1 or /job_applicants/1.json
  def show
  end

  # GET /job_applicants/new
  def new
    @job_applicant = JobApplicant.new
  end

  # GET /job_applicants/1/edit
  def edit
  end

  # POST /job_applicants or /job_applicants.json
  def create
    @job_applicant = JobApplicant.new(job_applicant_params)
    @job_applicant.applied_on = Date.current
    @job_applicant.job_posting = @job_posting

    respond_to do |format|
      if @job_applicant.save
        format.html { redirect_to organization_job_path(@job_posting.organization, @job_posting), notice: "Job application submitted succesfully" }
        format.json { render :show, status: :created, location: @job_applicant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def candidate_status
    @job_applicant = JobApplicant.find(params[:job_applicant_id])
    status = @job_applicant.build_candidate_status(candidate_status_params)
    status.status_by = @current_employee

    status.reason_doc.attach(params[:candidate_status][:reason_doc]) if params[:candidate_status][:reason_doc].present?

    if status.save
      if status.status == "rejected"
        send_rejection_email(@job_applicant, @job_applicant.job_posting)
      end
      redirect_to employee_recruitment_candidate_path(@current_employee, @job_applicant), notice: "Status saved successfully"
    else
      puts status.errors.full_messages
      render inertia: "Recruitment/Candidate", status: :unprocessable_entity, errors: status.errors
    end
  end

  def send_offer
    @job_applicant = JobApplicant.find(params[:job_applicant_id])
    status = @job_applicant.candidate_status
    status.status = :offer_sent

    status.offer_letter.attach(params[:candidate_status][:offer_letter]) if params[:candidate_status][:offer_letter].present?

    if status.save
      send_offer_email(@job_applicant, @job_applicant.job_posting)
      redirect_to employee_recruitment_candidate_path(@current_employee, @job_applicant), notice: "Offer letter sent successfully"
    else
      puts status.errors.full_messages
      render inertia: "Recruitment/Candidate", status: :unprocessable_entity, errors: status.errors
    end
  end

  def offer_acceptance
    @job_applicant = JobApplicant.find_by_token_for(:offer_acceptance, params[:sid])

    if @job_applicant.nil?
      redirect_to root_path, alert: "That offer acceptance link is invalid or has expired"
    else
      render inertia: "Recruitment/OfferAcceptance", props: {
        candidate: {
          id: @job_applicant.id,
          name: @job_applicant.full_name
        },
        job: @job_applicant.job_posting.title
      }
    end
  end

  def accept_offer
    @job_applicant = JobApplicant.find(params[:job_applicant_id])
    status = @job_applicant.candidate_status
    status.status = :offer_accepted
    status.offer_accepted_on = Date.current

    status.offer_letter_signed.attach(params[:candidate_status][:offer_letter_signed]) if params[:candidate_status][:offer_letter_signed].present?

    if status.save
      flash.now[:notice] = "Offer accepted successfully"
      redirect_to root_path
    else
      puts status.errors.full_messages
      render inertia: "Recruitment/OfferAcceptance", status: :unprocessable_entity, errors: status.errors
    end
  end

  def onboard
    @job_applicant = JobApplicant.find(params[:job_applicant_id])
    new_joiner = @job_applicant.build_new_joiner
    managers = @job_applicant.job_posting.organization.employees.map { |e| { id: e.id, name: e.full_name } }
    render inertia: "NewJoiner/New", props: { new_joiner:, managers:, name: @job_applicant.full_name, job_applicant_id: @job_applicant.id }
  end

  def onboard_save
    @job_applicant = JobApplicant.find(params[:job_applicant_id])
    new_joiner = @job_applicant.build_new_joiner(new_joiner_params)
    manager = Employee.find(params[:new_joiner][:manager_id])
    new_joiner.manager = manager

    if new_joiner.save
      organization = @job_applicant.job_posting.organization.name
      send_manager_welcome_email(new_joiner)
      send_welcome_email(new_joiner, organization)
      redirect_to employee_recruitment_candidate_path(@current_employee, @job_applicant), notice: "Onboarding details saved successfully"
    else
      render inertia: "NewJoiner/New", props: { new_joiner:, managers:, name: @job_applicant.full_name, errors: new_joiner.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_applicants/1 or /job_applicants/1.json
  def update
    respond_to do |format|
      if @job_applicant.update(job_applicant_params)
        format.html { redirect_to @job_applicant, notice: "Job applicant was successfully updated." }
        format.json { render :show, status: :ok, location: @job_applicant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applicants/1 or /job_applicants/1.json
  def destroy
    @job_applicant.destroy!

    respond_to do |format|
      format.html { redirect_to job_applicants_path, status: :see_other, notice: "Job applicant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_applicant
      @job_applicant = JobApplicant.find(params.expect(:id))
    end

    def set_job_posting
      @job_posting = JobPosting.find(params.expect(:job_posting_id))
    end

    # Only allow a list of trusted parameters through.
    def job_applicant_params
      params.expect(job_applicant: [ :job_posting_id, :applied_on, :first_name, :last_name, :middle_name, :email, :phone, :cv, other_docs: [] ])
    end

    def candidate_status_params
      params.expect(candidate_status: [ :reason, :status, :reason_doc, :offer_letter, :offer_letter_signed ])
    end

    def new_joiner_params
      params.expect(new_joiner: [ :manager_id, :start_date ])
    end

    def send_rejection_email(job_applicant, job_posting)
      CandidateMailer.rejected(job_applicant, job_posting).deliver_later
    end

    def send_offer_email(job_applicant, job_posting)
      CandidateMailer.offer(job_applicant, job_posting).deliver_later
    end

    def send_welcome_email(new_joiner, organization)
      OnboardingMailer.welcome(new_joiner, organization).deliver_later
    end

    def send_manager_welcome_email(new_joiner)
      OnboardingMailer.manager_welcome(new_joiner).deliver_later
    end
end
