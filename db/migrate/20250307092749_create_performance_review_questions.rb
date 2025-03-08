class CreatePerformanceReviewQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :performance_review_questions do |t|
      t.belongs_to :performance_review_type, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
