class AddOfferAcceptedOnToCandidateStatus < ActiveRecord::Migration[8.0]
  def change
    add_column :candidate_statuses, :offer_accepted_on, :date
    add_column :candidate_statuses, :offer_rejected_on, :date
  end
end
