# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
  has_many :interviews, through: :interview_stages
  has_many :interviewers, through: :employees
  has_many :leave_requests, through: :employees
  has_many :leave_balances, through: :employees
  has_many :benefit_elections, through: :employees
  has_many :benefit_plans, through: :benefit_elections
  has_many :performance_reviews
  has_many :channels
  has_many :channel_posts, through: :channels
  has_many :praise_posts, through: :channels
  has_many :pulse_surveys

  validates :name, presence: true, uniqueness: true
end
