class LeavePolicy < ApplicationRecord
  belongs_to :leave_category
  belongs_to :organization

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
