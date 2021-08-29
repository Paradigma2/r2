class JobApplicationMailer < ApplicationMailer
  default from: ENV['TEST_MAIL'] || 'samarijum+ignore@gmail.com'

  def new_application_email(job_application)
    @job_application = job_application

    mail to: @job_application.job_ad.email, subject: 'You have a new applicant!'
  end
end