class Holiday < ApplicationRecord
	validates :holiday_name, presence: true
	validates :holiday_date, presence: true
	validates :holiday_type, presence: true
	enum holiday_type: [:National,:Optional]
						 
end
