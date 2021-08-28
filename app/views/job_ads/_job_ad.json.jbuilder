json.extract! job_ad, :id, :name, :description, :employer, :email, :category, :valid_until, :status
json.url job_ad_url(job_ad, format: :json)
