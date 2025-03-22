# == Schema Information
#
# Table name: employees
#
#  id              :integer          not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  dob             :date             not null
#  addr_line1      :string
#  addr_line2      :string
#  addr_line3      :string
#  addr_postcode   :string
#  city            :string           not null
#  country         :string           not null
#  phone1          :string           not null
#  phone2          :string
#  personal_email  :string           not null
#  work_email      :string           not null
#  id_number       :string           not null
#  nationality     :string           not null
#  passport_number :string
#  hire_date       :date             not null
#  employement_id  :string
#  preferred_name  :string
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gender          :integer
#  manager_id      :integer
#
# Indexes
#
#  index_employees_on_manager_id       (manager_id)
#  index_employees_on_organization_id  (organization_id)
#

class Employee < ApplicationRecord
  enum :gender,  { male: 0, female: 1 }, validate: { allow_nil: false }

  belongs_to :organization
  belongs_to :manager, class_name: "Employee", optional: true

  has_many :reports, class_name: "Employee", foreign_key: "manager_id"
  has_one :user, dependent: :destroy
  has_one :emergency_contact, dependent: :destroy
  has_many :employee_files
  has_many :org_assets
  has_many :leave_balances
  has_many :leave_policies, through: :leave_balances
  has_many :leave_requests
  has_many :time_workeds
  has_many :benefit_elections
  has_many :benefit_plans, through: :benefit_elections
  has_many :benefits, through: :benefit_plans # this needs checking
  has_one :interviewers
  has_many :interviews, through: :interviewers
  has_many :personal_development_plans
  has_many :talents, through: :personal_development_plans
  has_many :growth_areas, through: :personal_development_plans
  has_many :motivations, through: :personal_development_plans
  has_many :career_visions, through: :personal_development_plans
  has_many :channel_memberships
  has_many :channels, through: :channel_memberships
  has_one :pulse_survey_response
  has_many :tasks



  after_create :create_user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :city, presence: true
  validates :personal_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :work_email, presence: true, uniqueness: { scope: :organization_id }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :id_number, presence: true
  validates :nationality, presence: true
  validates :hire_date, presence: true

  scope :same_organization, ->(organization) { where(organization: organization) }

  def is_manager?
    self.reports.any?
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  private
  def create_user
    email = self.work_email != self.personal_email ? self.work_email : self.personal_email
    @user = self.build_user(email: email, password: SecureRandom.base58, verified: true)
    @name = "#{self.first_name} #{self.last_name}"
    @organization = self.organization

    if @user.save
      UserMailer.with(user: @user, name: @name, organization: @organization).invite_to_org.deliver_later
    else
      errors.add(:base, @user.errors)
      logger.debug "User error #{@user.errors.inspect}"
      raise ActiveRecord::RecordNotSaved
    end
  end

  def invite_user
    UserMailer.with(user: @user, name:)
  end
end
