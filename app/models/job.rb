class Job < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["כל התחומים", "ייעוץ, מכירות ושיווק", "מקצועות המטבח", "מקצועות כלליים", "מקצועות ניהול ומנהלה", "מקצועות שירות ואירוח"]

  validates :title, presence: true
end
