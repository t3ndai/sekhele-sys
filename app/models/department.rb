class Department < ApplicationRecord
  belongs_to :organization
  has_many :job_functions

  validates :name, presence: true, uniqueness: { scope: :organization_id }
end
