class DailyTask < ApplicationRecord
	belongs_to :employee
	validates :description,  presence: true
end
