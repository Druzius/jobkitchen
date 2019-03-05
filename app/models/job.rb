class Job < ApplicationRecord
  belongs_to :user
  belongs_to :position

  has_many :job_applications, dependent: :destroy

  has_one :category, through: :position

  mount_uploader :avatar, AvatarUploader


  # JOB_TYPES = ["כל התחומים", "ייעוץ, מכירות ושיווק", "מקצועות המטבח", "מקצועות כלליים", "מקצועות ניהול ומנהלה", "מקצועות שירות ואירוח"]
  JOB_AREA = ["תל אביב והמרכז", "ירושלים וסביבותיה", "הצפון, חיפה והקריות", "אזור השרון", "השפלה ודרום הארץ", "אילת והערבה"]

  enum state: [ :pending, :verified ]

  validates :position, presence: true
  validates :location, presence: true

end
