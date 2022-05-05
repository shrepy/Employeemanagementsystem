class Holiday < ApplicationRecord
	validates :holiday_name, presence: true
	validates :holiday_date, presence: true
end
