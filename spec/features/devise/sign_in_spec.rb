require 'rails_helper'

RSpec.feature 'Devise sign in' do
  let!(:user) { create(:user, password: 'secret') }

  def login_user(email, password = 'password')
    visit '/users/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end

  scenario 'User sign in' do
    login_user(user.email, user.password)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User mismatched email login' do
    login_user('admin@example.com')
    expect(page).to_not have_content('Signed in successfully.')
  end

  scenario 'User mismatched password login' do
    login_user(user.email)
    expect(page).to_not have_content('Signed in successfully.')
  end
end
