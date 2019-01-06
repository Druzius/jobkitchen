class Job < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["Full-time", "Part-time", "Contract"]

  validates :title, presence: true
end
