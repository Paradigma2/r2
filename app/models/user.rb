class User < ApplicationRecord
  # validates :email, uniqueness: { case_sensitive: false }, presence: true
  # validates :encrypted_password, presence: true
  validates :full_name, presence: true

  devise :database_authenticatable, :validatable
end
