class JobApplication < ApplicationRecord
  belongs_to :job
  mount_uploader :resume, ResumeUploader

  # YEARS_EXPERIENCE = ["ללא ניסיון", "1-3 שנות ניסיון", "3-5 שנות ניסיון", "5+ שנות ניסיון"]
  # TODO: validations for all, required
  # TODO: validations for email and name (right format)
  # TODO: validations for city (actual city)
  # TODO: validations for resume (right file_type, PDF or docx)
  # TODO: validations for summary, work experience (max length)

  # TODO: email helper
  validates :full_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :phone_number, presence: true, numericality: true, length: { minimum: 2, maximum: 30 }
  validates :email, presence: true, length: { minimum: 2, maximum: 50 }, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :city, presence: true, length: { minimum: 2, maximum: 30 }

  validates :work_experience, length: { maximum: 200 }
  validates :summary, length: { maximum: 200 }
end
