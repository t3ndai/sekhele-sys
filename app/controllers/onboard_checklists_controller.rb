class OnboardChecklistsController < ApplicationController
  before_action :set_onboard_checklist, only: %i[ show edit update destroy ]
  before_action :set_new_joiner, only: %i[new create]

  inertia_share flash: -> { flash.to_hash }

  # GET /onboard_checklists
  def index
    @onboard_checklists = OnboardChecklist.all
    render inertia: "OnboardChecklist/Index", props: {
      onboard_checklists: @onboard_checklists.map do |onboard_checklist|
        serialize_onboard_checklist(onboard_checklist)
      end
    }
  end

  # GET /onboard_checklists/1
  def show
    render inertia: "OnboardChecklist/Show", props: {
      onboard_checklist: serialize_onboard_checklist(@onboard_checklist)
    }
  end

  # GET /onboard_checklists/new
  def new
    @onboard_checklist = OnboardChecklist.new

    render inertia: "OnboardChecklist/New", props: {
      onboard_checklist: serialize_onboard_checklist(@onboard_checklist),
      new_joiner_id: @new_joiner.id
    }
  end

  # GET /onboard_checklists/1/edit
  def edit
    render inertia: "OnboardChecklist/Edit", props: {
      onboard_checklist: serialize_onboard_checklist(@onboard_checklist)
    }
  end

  # POST /onboard_checklists
  def create
    @onboard_checklist = OnboardChecklist.new(onboard_checklist_params)
    @onboard_checklist.new_joiner = @new_joiner

    if @onboard_checklist.save
      redirect_to @new_joiner, notice: "Onboard checklist was successfully created."
    else
      redirect_to new_onboard_checklist_url, inertia: { errors: @onboard_checklist.errors }
    end
  end

  # PATCH/PUT /onboard_checklists/1
  def update
    if @onboard_checklist.update(onboard_checklist_params)
      redirect_to @onboard_checklist, notice: "Onboard checklist was successfully updated."
    else
      redirect_to edit_onboard_checklist_url(@onboard_checklist), inertia: { errors: @onboard_checklist.errors }
    end
  end

  # DELETE /onboard_checklists/1
  def destroy
    @onboard_checklist.destroy!
    redirect_to onboard_checklists_url, notice: "Onboard checklist was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboard_checklist
      @onboard_checklist = OnboardChecklist.find(params[:id])
    end

    def set_new_joiner
      @new_joiner = NewJoiner.find(params[:new_joiner_id])
    end

    # Only allow a list of trusted parameters through.
    def onboard_checklist_params
      params.require(:onboard_checklist).permit(:new_joiner_id, :name)
    end

    def serialize_onboard_checklist(onboard_checklist)
      onboard_checklist.as_json(only: [
        :id, :new_joiner_id, :name
      ])
    end
end
