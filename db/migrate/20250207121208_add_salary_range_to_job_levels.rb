class AddSalaryRangeToJobLevels < ActiveRecord::Migration[8.0]
  def change
    add_column :job_levels, :salary_range, :numrange
    add_column :job_levels, :range_percentile, :integer
  end
end
