class JobApplication < ApplicationRecord
  belongs_to :job_ad

  validates :phone_number, presence: true
  validate :validate_phone
  validates :qualification, presence: true
  validates :job_ad_id, presence: true
  validates :email, presence: true
  validate :validate_email
  validates :full_name, presence: true
  validates :address, presence: true

  enum qualification: { VSS: 0, VŠS: 1, SSS: 2, NK: 3 }

  private

  def validate_phone
    if phone_number =~ /[a-zA-Z]+/
      errors.add :phone_number, 'is not an phone number'
    end
  end

  def validate_email
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add :email, 'is not an email'
    end
  end
end
