class Task < ApplicationRecord
  belongs_to :assigned_by
  belongs_to :assignee
  has_many_attached :files
end
