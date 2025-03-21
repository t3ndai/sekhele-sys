# == Schema Information
#
# Table name: job_levels
#
#  id               :integer          not null, primary key
#  job_function_id  :integer          not null
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  salary_range     :numrange
#  range_percentile :integer
#
# Indexes
#
#  index_job_levels_on_job_function_id  (job_function_id)
#

class JobLevel < ApplicationRecord
  belongs_to :job_function

  validates :name, presence: true, uniqueness: { scope: :job_function_id }
end
