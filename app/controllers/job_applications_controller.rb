class JobApplicationsController < ApplicationController
  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_ad = @job_application.job_ad

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_ad, notice: 'Job Application was successfully created.' }
        format.json { render :show, status: :created, location: @job_ad }
      else
        format.html { render :'job_ads/show' }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:job_ad_id, :full_name, :email, :date_of_birth, :address, :phone_number, :qualification)
  end
end
