require 'rails_helper'

RSpec.feature 'Devise sign out' do
  let!(:user) { create(:user, password: 'secret') }

  def login_user(email, password = 'password')
    visit '/users/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end

  def logout_user
    click_link 'Sign Out'
  end

  scenario 'User sign out' do
    login_user(user.email, user.password)
    expect(page).to have_content('Signed in successfully.')
    logout_user
    expect(page).to have_content('Signed out successfully.')
  end
end
