require 'rails_helper'

RSpec.describe JobApplication, type: :request do
  describe 'create' do
    let!(:job_ad) { create(:job_ad) }

    example 'Create an add' do
      params = {
        job_application: {
          full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          email: Faker::Internet.email,
          phone_number: Faker::PhoneNumber.cell_phone,
          address: Faker::Address.full_address,
          qualification: JobApplication.qualifications.keys.sample,
          date_of_birth: Faker::Date.birthday,
          job_ad_id: job_ad.id
        }
      }

      post('/job_applications', params: params)
      expect(response).to redirect_to job_ad_url(job_ad)
      expect(response).to have_http_status(302)
      follow_redirect!
      expect(response).to have_http_status(200)
    end

    [:full_name, :email, :phone_number, :address, :qualification].each do |attribute|
      example "Fail when #{attribute} is missing" do
        params = {
          job_application: {
            full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
            email: Faker::Internet.email,
            phone_number: Faker::PhoneNumber.cell_phone,
            address: Faker::Address.full_address,
            qualification: JobApplication.qualifications.keys.sample,
            date_of_birth: Faker::Date.birthday,
            job_ad_id: job_ad.id
          }.except(attribute)
        }

        post('/job_applications', params: params)
        expect(response).to_not redirect_to job_ad_url(job_ad)
        expect(response).to have_http_status(200)
        expect(response.body).to include('can&#39;t be blank')
      end
    end

    example 'Fail when email is not valid' do
      params = {
        job_application: {
          full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          email: 'qwerty',
          phone_number: Faker::PhoneNumber.cell_phone,
          address: Faker::Address.full_address,
          qualification: JobApplication.qualifications.keys.sample,
          date_of_birth: Faker::Date.birthday,
          job_ad_id: job_ad.id
        }
      }

      post('/job_applications', params: params)
      expect(response).to_not redirect_to job_ad_url(job_ad)
      expect(response).to have_http_status(200)
      expect(response.body).to include('Email is not an email')
    end

    example 'Fail when phone is not valid' do
      params = {
        job_application: {
          full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
          email: Faker::Internet.email,
          phone_number: '+1234567a9',
          address: Faker::Address.full_address,
          qualification: JobApplication.qualifications.keys.sample,
          date_of_birth: Faker::Date.birthday,
          job_ad_id: job_ad.id
        }
      }

      post('/job_applications', params: params)
      expect(response).to_not redirect_to job_ad_url(job_ad)
      expect(response).to have_http_status(200)
      expect(response.body).to include('Phone number is not an phone number')
    end
  end
end
