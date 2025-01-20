class Organization < ApplicationRecord
  has_many :departments
  has_many :employees
  has_many :users, through: :employees

  validates :name, presence: true, uniqueness: true
end
