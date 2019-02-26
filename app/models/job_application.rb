class JobApplication < ApplicationRecord
  belongs_to :job

  # YEARS_EXPERIENCE = ["ללא ניסיון", "1-3 שנות ניסיון", "3-5 שנות ניסיון", "5+ שנות ניסיון"]
  # TODO: validations for all, required
  # TODO: validations for email and name (right format)
  # TODO: validations for city (actual city)
  # TODO: validations for resume (right file_type, PDF or docx)
  # TODO: validations for summary, work experience (max length)

  # TODO: email helper

end
