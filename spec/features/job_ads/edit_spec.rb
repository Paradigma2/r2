require 'rails_helper'

RSpec.feature 'Job ad edit' do
  let!(:user) { create(:user) }
  let!(:job_ad) { create(:job_ad, user: user) }
  let!(:another_ad) { create(:job_ad) }

  def login_user(email, password = 'password')
    visit '/users/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end

  scenario 'User fills all the fields' do
    login_user(user.email, user.password)
    visit "job_ads/#{job_ad.id}/edit"
    fill_in 'Name', with: Faker::Lorem.sentence
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Employer', with: Faker::Company.name
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    attach_file('job_ad_document', Rails.root.join('spec/support/example.html'))
    click_button 'Update Job ad'
    expect(page).to have_content('The ad was successfully updated.')
  end

  scenario 'User fills an invalid email' do
    login_user(user.email, user.password)
    visit "job_ads/#{job_ad.id}/edit"
    fill_in 'Name', with: Faker::Lorem.sentence
    fill_in 'Description', with: Faker::Lorem.paragraph
    fill_in 'Email', with: 'qwerty'
    fill_in 'Employer', with: Faker::Company.name
    select JobAd.categories.keys.sample, from: 'job_ad_category'
    select Date.tomorrow.year, from: 'job_ad_valid_until_1i'
    select Date.tomorrow.strftime('%B'), from: 'job_ad_valid_until_2i'
    select Date.tomorrow.day, from: 'job_ad_valid_until_3i'
    click_button 'Update Job ad'
    expect(page).to have_content('Email is not an email')
  end

  scenario 'User tries to edit an ad that does not belong to him' do
    login_user(user.email, user.password)
    visit "job_ads/#{another_ad.id}/edit"
    expect(page).to have_content('You are not allowed to access this resource')
  end
end
