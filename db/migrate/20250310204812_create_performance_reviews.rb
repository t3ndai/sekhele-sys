class CreatePerformanceReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :performance_reviews do |t|
      t.belongs_to :performance_review_type, null: false, foreign_key: true
      t.date :opens_on
      t.date :closes_on
      t.string :name
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
