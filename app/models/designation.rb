class Designation < ApplicationRecord
	has_one :employee, dependent: :destroy
end
