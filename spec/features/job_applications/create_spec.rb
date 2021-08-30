require 'rails_helper'

RSpec.feature 'Job app create' do
  let!(:job_ad) { create(:job_ad) }

  scenario 'User fills all the fields' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Full Name', with: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in 'Phone Number', with: Faker::PhoneNumber.cell_phone
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Address', with: Faker::Address.full_address
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content('Job Application was successfully created.')
  end

  scenario 'User omits name' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Phone Number', with: Faker::PhoneNumber.cell_phone
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Address', with: Faker::Address.full_address
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content("Full name can't be blank")
  end

  scenario 'User omits phone' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Full Name', with: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Address', with: Faker::Address.full_address
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content("Phone number can't be blank")
  end

  scenario 'User inserts an invalid phone' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Full Name', with: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in 'Phone Number', with: '+123a45678'
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Address', with: Faker::Address.full_address
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content('Phone number is not an phone number')
  end

  scenario 'User omits address' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Full Name', with: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in 'Phone Number', with: Faker::PhoneNumber.cell_phone
    fill_in 'Email', with: Faker::Internet.email
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content("Address can't be blank")
  end

  scenario 'User omits email' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Full Name', with: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in 'Phone Number', with: Faker::PhoneNumber.cell_phone
    fill_in 'Address', with: Faker::Address.full_address
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'User inserts an invalid mail' do
    visit "job_ads/#{job_ad.id}"
    fill_in 'Full Name', with: "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    fill_in 'Phone Number', with: Faker::PhoneNumber.cell_phone
    fill_in 'Email', with: 'qwerty'
    fill_in 'Address', with: Faker::Address.full_address
    select JobApplication.qualifications.keys.sample, from: 'job_application_qualification'
    select Date.tomorrow.year, from: 'job_application_date_of_birth_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_application_date_of_birth_2i'
    select Date.tomorrow.day, from: 'job_application_date_of_birth_3i'
    click_button 'Create Job application'
    expect(page).to have_content('Email is not an email')
  end
end
