class OnboardingEventNotificationMailer < ApplicationMailer
  def notify_new_joiner(onboarding_event)
    @onboarding_event = onboarding_event
    @new_joiner = onboarding_event.new_joiner

    mail to: @new_joiner.job_applicant.email, subject: "Onboarding Details"
  end

  def notify_manager(onboarding_event)
    @onboarding_event = onboarding_event
    @new_joiner = onboarding_event.new_joiner
    @manager = onboarding_event.manager

    mail to: @manager.work_email, subject: "#{@new_joiner.job_applicant.full_name} Onboarding Details"
  end

  def notify_contact(onboarding_event)
    @onboarding_event = onboarding_event
    @new_joiner = onboarding_event.new_joiner
    @contact = onboarding_event.contact
    @manager = onboarding_event.manager

    mail to: @contact.work_email, subject: "#{@new_joiner.job_applicant.full_name} Onboarding Details"
  end
end
