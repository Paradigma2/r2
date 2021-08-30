require 'rails_helper'

RSpec.feature 'Job ad show' do
  let!(:user) { create(:user) }
  let!(:job_ad) { create(:job_ad, user: user) }
  let!(:another_ad) { create(:job_ad) }

  def login_user(email, password = 'password')
    visit '/users/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end

  scenario 'Unregistered user is shown an ad' do
    visit "job_ads/#{job_ad.id}"

    expect(page).to have_content(job_ad.name)
    expect(page).to have_content(job_ad.email)
    expect(page).to have_content(job_ad.description)
    expect(page).not_to have_content('Edit')
  end

  scenario 'Registered user is shown an ad' do
    login_user(user.email, user.password)
    visit "job_ads/#{another_ad.id}"

    expect(page).to have_content(another_ad.name)
    expect(page).to have_content(another_ad.email)
    expect(page).to have_content(another_ad.description)
    expect(page).not_to have_content('Edit')
  end

  scenario 'Registered user is shown an ad' do
    login_user(user.email, user.password)
    visit "job_ads/#{job_ad.id}"

    expect(page).to have_content(job_ad.name)
    expect(page).to have_content(job_ad.email)
    expect(page).to have_content(job_ad.description)
    expect(page).to have_content('Edit')
  end
end
