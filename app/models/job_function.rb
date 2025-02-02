class JobFunction < ApplicationRecord
  belongs_to :department, optional: true
  belongs_to :organization

  validates :title, presence: true, uniqueness: { scope: :organization_id }
end
