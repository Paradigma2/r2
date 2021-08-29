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

require 'rails_helper'

RSpec.describe JobAd, type: :model do
  let!(:job_ad) { create(:job_ad) }

  it 'is valid with valid attributes' do
    expect(job_ad).to be_valid
  end

  it 'is not valid without name' do
    job_ad.name = nil
    expect(job_ad).to_not be_valid
  end

  it 'is not valid without employer' do
    job_ad.employer = nil
    expect(job_ad).to_not be_valid
  end

  it 'is not valid without email' do
    job_ad.email = nil
    expect(job_ad).to_not be_valid
  end

  it 'is not valid without valid email' do
    job_ad.email = 'qwerty'
    expect(job_ad).to_not be_valid
  end

  it 'is not valid without category' do
    job_ad.category = nil
    expect(job_ad).to_not be_valid
  end

  it 'is expired if its validation date has passed' do
    job_ad.valid_until = Date.yesterday
    expect(job_ad.status).to eq 'expired'
  end

  it 'is active if its validation date is yet to pass' do
    job_ad.valid_until = Date.tomorrow
    expect(job_ad.status).to eq 'active'
  end
end
