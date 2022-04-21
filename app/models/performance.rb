class Performance < ApplicationRecord
  belongs_to :employee
  validates :month, presence: true
  validates :points, presence: true
end
