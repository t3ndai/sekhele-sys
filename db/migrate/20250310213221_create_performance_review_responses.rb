class CreatePerformanceReviewResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :performance_review_responses do |t|
      t.belongs_to :reviewer, null: false, foreign_key: { to_table: :employees }
      t.belongs_to :reviewee, null: false, foreign_key: { to_table: :employees }
      t.string :status
      t.jsonb :response
      t.date :submitted_on
      t.belongs_to :performance_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
