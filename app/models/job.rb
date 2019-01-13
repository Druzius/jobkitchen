class Job < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["כל התחומים", "ייעוץ, מכירות ושיווק", "מקצועות המטבח", "מקצועות כלליים", "מקצועות ניהול ומנהלה", "מקצועות שירות ואירוח"]
  JOB_AREA = ["תל אביב והמרכז", "ירושלים וסביבותיה", "הצפון, חיפה והקריות", "אזור השרון", "השפלה ודרום הארץ", "אילת והערבה"]

  validates :title, presence: true
end
