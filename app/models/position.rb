class Position < ApplicationRecord
  belongs_to :category
  has_many :jobs
end
