class Employee < ApplicationRecord
  enum :gender,  { male: 0, female: 1 }, validate: { allow_nil: false }

  belongs_to :organization
  has_one :user, dependent: :destroy
  has_many :employee_files

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
