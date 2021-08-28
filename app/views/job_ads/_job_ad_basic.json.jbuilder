json.extract! job_ad, :id, :name, :employer, :category, :status
json.url job_ad_url(job_ad, format: :json)
