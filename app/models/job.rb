class Job < ApplicationRecord
  belongs_to :user
  has_many :job_applications, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  JOB_TYPES = ["כל התחומים", "ייעוץ, מכירות ושיווק", "מקצועות המטבח", "מקצועות כלליים", "מקצועות ניהול ומנהלה", "מקצועות שירות ואירוח"]
  JOB_AREA = ["תל אביב והמרכז", "ירושלים וסביבותיה", "הצפון, חיפה והקריות", "אזור השרון", "השפלה ודרום הארץ", "אילת והערבה"]

  SALES = ["אחראי/ת משמרת",
           "פקיד/ת  קבלה",
           "דור מן/ית",
           "חדרן/ית",
           "מוכר/ת",
           "מזכיר/ה",
           "מטפל/ת ספא",
           "מנהל/ת אירועים",
           "מנהל/ת חדר אוכל",
           "מנהל/ת לובי",
           "מציל/ה",
           "מתאמ/ת",
           "מתאמ/ת קבוצות",
           "קבט/ית",
           "קונסיארג'/ית",
           "קופאי/ת",
           "קניין/ת",
           "רסיבר/ית" ]

  KITCHEN = ["אופה",
             "איש/ת לחם",
             "גלידן/ית",
             "גרילמן/ית",
             "טבח/ית",
             "מנהל/ת מטבח",
             "סו שף/ית",
             "סו שף/ית קונדיטור",
             "עוזר טבח/ית",
             "צ'קר/ית",
             "קונדיטור/ית",
             "קניין/ת",
             "קצב/ית",
             "שוקולטייר/ית",
             "שף/ית",
             "שף/ית קונדיטור"]

  SERVICE = [
    "אחראי/ת משמרת",
    "בריסטה",
    "ברמן/ית",
    "מארח/ת",
    "מלצר/ית",
    "מנהל/ת",
    "מנהל/ת אירועים",
    "מנהל/ת תחנה",
    "סגן/ית מנהל/ת",
    "עובד/ת דלפק",
  "קופאי/ת"]

  MANAGEMENT = [
    'יועץ/ת עיסקי',
    'מנהל/ת',
    'מנהל/ת חשבונות',
    'מנהל/ת כספים',
    'מנהל/ת מזומ"ש',
    'מנהל/ת רכש',
    'מנכ"ל/ית',
    'סגן מנהל/ת כספים',
    'סגן מנהל/ת מזומ"ש',
    'סמנכ"ל/ית',
    'פקיד/ת',
    'רואה/ת חשבון',
    'סגן/ית מנהל/ת'
  ]

  GENERAL = ["אינסטלטור/ית",
             "חשמלאי/ת",
             "מחסנאי/ת",
             "מטפל/ת",
             "נהג/ת",
             "עובד/ת אחזקה",
             "עובד/ת כללי",
             "עובד/ת משק",
             "עובד/ת נקיון",
             "שוטף/ת כלים",
             "עוזר/ת"]


  enum state: [ :pending, :verified ]

  validates :title, presence: true
end
