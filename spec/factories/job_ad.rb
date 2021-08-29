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

FactoryBot.define do
  factory :job_ad do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    employer { Faker::Company.name }
    email { Faker::Internet.email }
    category { JobAd.categories.keys.sample }
    valid_until { Date.current + 7.days }
    user { create(:user) }

    trait :expired do
      valid_until { Date.current - 7.days }
    end
  end
end
