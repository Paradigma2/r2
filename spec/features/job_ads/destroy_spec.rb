# require 'rails_helper'
#
# RSpec.feature 'Job ad destroy' do
#   # before(:all) do
#   #   Capybara.current_driver = :selenium
#   # end
#   # after(:all) do
#   #   Capybara.use_default_driver
#   # end
#
#   let!(:user) { create(:user) }
#   let!(:job_ad) { create(:job_ad, user: user) }
#   let!(:another_ad) { create(:job_ad) }
#
#   def login_user(email, password = 'password')
#     visit '/users/sign_in'
#     fill_in 'user_email', with: email
#     fill_in 'user_password', with: password
#     click_button 'Sign in'
#   end
#
#   scenario 'User fills all the fields' do
#     login_user(user.email, user.password)
#     visit "job_ads/#{job_ad.id}"
#     # page.evaluate_script('window.confirm = function() { return true; }')
#     # page.accept_alert 'Are you sure?' do
#       click_link 'Delete'
#     # end
#     # page.driver.browser.switch_to.alert.accept
#     # click_link 'Ok'
#     expect(page).to have_content('The ad was successfully deleted.')
#   end
# end
