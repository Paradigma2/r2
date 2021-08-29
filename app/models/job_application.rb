# == Schema Information
#
# Table name: job_applications
#
#  id            :bigint           not null, primary key
#  job_ad_id     :bigint           not null
#  email         :string           not null
#  full_name     :string           not null
#  date_of_birth :date
#  address       :string           not null
#  phone_number  :string           not null
#  qualification :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
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

  after_create :notify

  private

  def validate_phone
    errors.add :phone_number, 'is not an phone number' if phone_number =~ /[a-zA-Z]+/
  end

  def validate_email
    errors.add :email, 'is not an email' unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end

  def notify
    JobApplicationMailer.new_application_email(self).deliver_later
  end
end
