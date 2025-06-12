class OnboardingEventsController < ApplicationController
  before_action :set_onboarding_event, only: %i[ show edit update destroy ]
  before_action :set_new_joiner, only: %i[ new create]

  inertia_share flash: -> { flash.to_hash }

  # GET /onboarding_events
  def index
    @onboarding_events = OnboardingEvent.all
    render inertia: "OnboardingEvent/Index", props: {
      onboarding_events: @onboarding_events.map do |onboarding_event|
        serialize_onboarding_event(onboarding_event)
      end
    }
  end

  # GET /onboarding_events/1
  def show
    render inertia: "OnboardingEvent/Show", props: {
      onboarding_event: serialize_onboarding_event(@onboarding_event)
    }
  end

  # GET /onboarding_events/new
  def new
    contacts = @current_employee.organization.employees.map do |contact|
      {
        id: contact.id,
        name: contact.full_name
      }
    end
    @onboarding_event = OnboardingEvent.new
    render inertia: "OnboardingEvent/New", props: {
      onboarding_event: serialize_onboarding_event(@onboarding_event),
      contacts:,
      new_joiner: {
        name: @new_joiner.job_applicant.full_name,
        id: @new_joiner.id
      }
    }
  end

  # GET /onboarding_events/1/edit
  def edit
    render inertia: "OnboardingEvent/Edit", props: {
      onboarding_event: serialize_onboarding_event(@onboarding_event)
    }
  end

  # POST /onboarding_events
  def create
    @onboarding_event = OnboardingEvent.new(onboarding_event_params)
    @onboarding_event.new_joiner = @new_joiner
    @onboarding_event.manager = @new_joiner.manager

    if @onboarding_event.save
      notify_contact(@onboarding_event)
      notify_manager(@onboarding_event)
      notify_new_joiner(@onboarding_event)
      redirect_to new_joiner_url(@new_joiner), notice: "Onboarding event was successfully created."
    else
      redirect_to new_onboarding_event_url, inertia: { errors: @onboarding_event.errors }
    end
  end

  # PATCH/PUT /onboarding_events/1
  def update
    if @onboarding_event.update(onboarding_event_params)
      redirect_to @onboarding_event, notice: "Onboarding event was successfully updated."
    else
      redirect_to edit_onboarding_event_url(@onboarding_event), inertia: { errors: @onboarding_event.errors }
    end
  end

  # DELETE /onboarding_events/1
  def destroy
    @onboarding_event.destroy!
    redirect_to onboarding_events_url, notice: "Onboarding event was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboarding_event
      @onboarding_event = OnboardingEvent.find(params[:id])
    end

    def set_new_joiner
      @new_joiner = NewJoiner.find(params[:new_joiner_id])
    end

    # Only allow a list of trusted parameters through.
    def onboarding_event_params
      params.require(:onboarding_event).permit(:new_joiner_id, :contact_id, :manager_id, :on, :at, :instructions)
    end

    def serialize_onboarding_event(onboarding_event)
      onboarding_event.as_json(only: [
        :id, :new_joiner_id, :contact_id, :manager_id, :on, :at, :instructions, :location
      ])
    end

    def notify_new_joiner(onboarding_event)
      OnboardingEventNotificationMailer.notify_new_joiner(onboarding_event).deliver_later
    end

    def notify_manager(onboarding_event)
      OnboardingEventNotificationMailer.notify_manager(onboarding_event).deliver_later
    end

    def notify_contact(onboarding_event)
      OnboardingEventNotificationMailer.notify_contact(onboarding_event).deliver_later
    end
end
