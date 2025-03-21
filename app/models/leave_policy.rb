# == Schema Information
#
# Table name: leave_policies
#
#  id                :integer          not null, primary key
#  leave_category_id :integer          not null
#  start_balance     :integer
#  valid_from        :date
#  valid_to          :date
#  organization_id   :integer          not null
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_leave_policies_on_leave_category_id  (leave_category_id)
#  index_leave_policies_on_organization_id    (organization_id)
#

class LeavePolicy < ApplicationRecord
  belongs_to :leave_category
  belongs_to :organization

  has_many :leave_requests

  validate :validate_balance_expires_after_starts

  validates :name, presence: true, uniqueness: { scope: :leave_category }
  validates :start_balance, presence: true, numericality: { only_integer: true }
  validates :valid_from, presence: true
  validates :valid_to, presence: true

  def validate_balance_expires_after_starts
    if valid_to < valid_from
      errors.add(:valid_to, "Balance expiry can't be before Balance Starts")
    end
  end
end
