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

FactoryBot.define do
  factory :user do
    full_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end
end
