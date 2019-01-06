class Job < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["Full-time", "Part-time", "Contract"]

  validates :title, :apply_url, :job_type, :job_author, :location, :avatar, :description, presence: true
end
