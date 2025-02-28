class Organization < ApplicationRecord
  has_many :departments
  has_many :employees
  has_many :users, through: :employees
  has_many :locations
  has_many :cost_centers
  has_many :job_functions
  has_many :job_levels, through: :job_functions
  has_many :documents
  has_many :company_files
  has_many :asset_categories
  has_many :org_assets, through: :asset_categories
  has_many :leave_categories
  has_many :leave_policies
  has_many :time_workeds, through: :employees
  has_many :benefit_types
  has_many :benefits
  has_many :job_postings
  has_many :job_applicants, through: :job_postings
  has_many :interview_stages

  validates :name, presence: true, uniqueness: true
end
