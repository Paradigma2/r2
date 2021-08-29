# == Schema Information
#
# Table name: job_ads
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  employer    :string           not null
#  email       :string           not null
#  category    :integer          not null
#  valid_until :date
#  document    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
class JobAd < ApplicationRecord
  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, 'is not an email' unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end

  mount_uploader :document, DocumentUploader

  validates :email, presence: true
  validate :validate_email
  validates :name, presence: true
  validates :employer, presence: true
  validates :category, presence: true

  has_many :job_applications, dependent: :destroy
  belongs_to :user

  enum category: { iOS: 0, Java: 1, Ruby: 2, Python: 3, DevOps: 4, QA: 5 }

  def status
    Date.current <= valid_until ? 'active' : 'expired'
  end

  private

  def validate_email
    errors.add :email, 'is not an email' unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end
