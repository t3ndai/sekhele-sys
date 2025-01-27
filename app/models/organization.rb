class Organization < ApplicationRecord
  has_many :departments
  has_many :employees
  has_many :users, through: :employees
  has_many :locations
  has_many :cost_centers

  validates :name, presence: true, uniqueness: true
end
