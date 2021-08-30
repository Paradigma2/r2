require 'rails_helper'

RSpec.feature 'Job ad create' do
  let!(:user) { create(:user) }

  def login_user(email, password = 'password')
    visit '/users/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end

  scenario 'User fills all the fields' do
    login_user(user.email, user.password)
    visit 'job_ads/new'
    fill_in 'Name', with: Faker::Lorem.sentence
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Employer', with: Faker::Company.name
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    attach_file('job_ad_document', Rails.root.join('spec/support/example.html'))
    click_button 'Create Job ad'
    expect(page).to have_content('The ad was successfully created.')
  end

  scenario 'User omits name' do
    login_user(user.email, user.password)
    visit 'job_ads/new'
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Employer', with: Faker::Company.name
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    click_button 'Create Job ad'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'User omits email' do
    login_user(user.email, user.password)
    visit 'job_ads/new'
    fill_in 'Name', with: Faker::Lorem.sentence
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: ''
    fill_in 'Employer', with: Faker::Company.name
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    click_button 'Create Job ad'
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'User fills an invalid email' do
    login_user(user.email, user.password)
    visit 'job_ads/new'
    fill_in 'Name', with: Faker::Lorem.sentence
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: 'qwerty'
    fill_in 'Employer', with: Faker::Company.name
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    click_button 'Create Job ad'
    expect(page).to have_content('Email is not an email')
  end

  scenario 'User omits employer' do
    login_user(user.email, user.password)
    visit 'job_ads/new'
    fill_in 'Name', with: Faker::Lorem.sentence
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: Faker::Internet.email
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    click_button 'Create Job ad'
    expect(page).to have_content("Employer can't be blank")
  end
end
