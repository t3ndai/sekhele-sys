class CreatePerformanceReviewAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :performance_review_answers do |t|
      t.belongs_to :performance_review_response, null: false, foreign_key: true
      t.belongs_to :performance_review_question, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
