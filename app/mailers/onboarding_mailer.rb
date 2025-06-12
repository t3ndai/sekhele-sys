class OnboardingMailer < ApplicationMailer
  def welcome(new_joiner, organization)
    @new_joiner = new_joiner
    @organization = organization

    mail to: @new_joiner.job_applicant.email, subject: "Welcome to #{@organization}"
  end

  def manager_welcome(new_joiner)
    @new_joiner = new_joiner
    @manager = new_joiner.manager

    mail to: @manager.work_email, subject: "New Joiner #{@new_joiner.job_applicant.full_name}"
  end
end
