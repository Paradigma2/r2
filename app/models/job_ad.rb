class JobAd < ApplicationRecord
  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors.add attribute, 'is not an email'
      end
    end
  end

  mount_uploader :document, DocumentUploader

  validates :email, presence: true
  validate :validate_email
  validates :name, presence: true
  validates :employer, presence: true

  has_many :job_applications, dependent: :destroy
  belongs_to :user

  enum category: { iOS: 0, Java: 1, Ruby: 2, Python: 3, DevOps: 4, QA: 5 }

  def status
    Date.current <= valid_until ? 'active' : 'expired'
  end

  private

  def validate_email
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add :email, 'is not an email'
    end
  end
end
