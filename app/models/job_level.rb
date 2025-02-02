class JobLevel < ApplicationRecord
  belongs_to :job_function

  validates :name, presence: true, uniqueness: { scope: :job_function_id }
end
