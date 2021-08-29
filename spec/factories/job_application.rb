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

FactoryBot.define do
  factory :job_application do
    full_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    qualification { JobApplication.qualifications.keys.sample }
    date_of_birth { Faker::Date.birthday }
    job_ad { create(:job_ad) }
  end
end
