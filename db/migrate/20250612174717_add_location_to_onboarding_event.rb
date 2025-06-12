class AddLocationToOnboardingEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :onboarding_events, :location, :string
  end
end
