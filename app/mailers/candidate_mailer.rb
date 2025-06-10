class CandidateMailer < ApplicationMailer
  def rejected(candiate, job_posting)
    @candidate = candiate

    @job_posting = job_posting

    mail to: @candidate.email, subject: "Application Rejected for #{@job_posting.title}"
  end

  def offer(candidate, job_posting)
    attachments["offer_letter.pdf"] = candidate.candidate_status.offer_letter.download if candidate.candidate_status&.offer_letter&.attached?
    @candidate = candidate
    @job_posting = job_posting
    @signed_id = @candidate.generate_token_for(:offer_acceptance)


    mail to: @candidate.email, subject: "Offer Letter for #{@job_posting.title}"
  end
end
