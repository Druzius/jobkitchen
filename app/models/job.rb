class Job < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["Full-time", "Part-time", "Contract"]

  validates :title, presence: true
  validates :apply_url, presence: true
  validates :job_type, presence: true
  validates :job_author, presence: true
  validates :location, presence: true
  validates :avatar, presence: true
  validates :description, presence: true
end
