class JobAdsController < ApplicationController
  before_action :set_job_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @job_ads = JobAd.all
  end

  def show
    @job_application = JobApplication.new
  end

  def new
    authorize(JobAd)

    @job_ad = JobAd.new
  end

  def edit
    authorize(@job_ad)
  end

  def create
    authorize(JobAd)

    @job_ad = JobAd.new(job_ad_params)

    respond_to do |format|
      if @job_ad.save
        format.html { redirect_to @job_ad, notice: 'The ad was successfully created.' }
        format.json { render :show, status: :created, location: @job_ad }
      else
        format.html { render :new }
        format.json { render json: @job_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_ad.update(job_ad_params)
        format.html { redirect_to @job_ad, notice: 'The ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_ad }
      else
        format.html { render :edit }
        format.json { render json: @job_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize(@job_ad)

    @job_ad.destroy
    respond_to do |format|
      format.html { redirect_to job_ads_path, notice: 'The ad was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_job_ad
    @job_ad = JobAd.find(params[:id])
  end

  def job_ad_params
    params.require(:job_ad).permit(:name, :description, :employer, :email, :category, :valid_until, :document, :user_id)
  end
end
