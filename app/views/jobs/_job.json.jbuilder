json.extract! job, :id, :title, :description, :job_type, :location, :job_author, :location, :created_at, :updated_at
json.url job_url(job, format: :json)
