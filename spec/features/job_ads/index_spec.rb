require 'rails_helper'

RSpec.feature 'Job ad index' do
  def create_ads(number_of_ads)
    array = []

    number_of_ads.times do
      array << create(:job_ad)
    end

    array
  end

  scenario 'User lists all ads' do
    ads = create_ads(5)

    visit 'job_ads'

    5.times do |i|
      expect(page).to have_content(ads[i].name)
    end
  end
end
