class Category < ApplicationRecord
  has_many :positions
  has_many :jobs, through: :positions
  # belongs_to :jobs, through: :position
  # belongs_to :job, through: :position
end
