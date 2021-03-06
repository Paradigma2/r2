# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  full_name          :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  # validates :email, uniqueness: { case_sensitive: false }, presence: true
  # validates :encrypted_password, presence: true
  validates :full_name, presence: true

  devise :database_authenticatable, :validatable

  has_many :job_ads, dependent: :nullify
end
