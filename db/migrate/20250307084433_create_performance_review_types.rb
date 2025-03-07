class CreatePerformanceReviewTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :performance_review_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
