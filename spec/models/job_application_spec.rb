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

require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  let!(:job_application) { create(:job_application) }

  it 'is valid with valid attributes' do
    expect(job_application).to be_valid
  end

  it 'is not valid without job ad' do
    job_application.job_ad_id = nil
    expect(job_application).to_not be_valid
  end

  it 'is not valid without name' do
    job_application.full_name = nil
    expect(job_application).to_not be_valid
  end

  it 'is not valid without email' do
    job_application.email = nil
    expect(job_application).to_not be_valid
  end

  it 'is not valid without valid email' do
    job_application.email = 'qwerty'
    expect(job_application).to_not be_valid
  end

  it 'is not valid without phone' do
    job_application.phone_number = nil
    expect(job_application).to_not be_valid
  end

  it 'is not valid without a valid phone' do
    job_application.phone_number = 'qwerty'
    expect(job_application).to_not be_valid
  end

  it 'is not valid without address' do
    job_application.address = nil
    expect(job_application).to_not be_valid
  end

  it 'is not valid without qualification' do
    job_application.qualification = nil
    expect(job_application).to_not be_valid
  end
end
